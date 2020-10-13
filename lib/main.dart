import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

import 'package:svlight/svlight.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  Logger.root.level = Level.INFO;
  final program = Program<SvModel, Msg, SvSub>(
    init,
    update,
    view,
    // subscription:
  );

  runApp(SvApp(program));
}

class SvApp extends StatelessWidget {
  final Program darteaProgram;

  SvApp(this.darteaProgram);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SVLight Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: darteaProgram.build(key: Key('root_key'), withMessagesBus: true),
    );
  }
}

Upd<SvModel, Msg> init() {
  var web3 = mkWeb3Client();
  return Upd(
    SvModel(democAttrs: BuiltMap(), democs: BuiltMap()),
    effects: Cmd.batch([
      Cmd.ofAsyncFunc(
        () async => await getSvContracts(web3),
        onSuccess: (SvCoreContracts svcc) {
          return SetSvCoreAndDemocs(
              svcc,
              DEMOC_HASHES
                  .map((key, value) => MapEntry(key, hexToBytes(value))));
        },
      )
    ]),
  );
}

Future updateNBallots(String democHash) async {}

Widget view(BuildContext context, Dispatch<Msg> dispatch, SvModel model) {
  var theme = Theme.of(context);
  return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'SecureVote Light Admin',
                style: theme.textTheme.headline4
                    .merge(theme.primaryTextTheme.headline4),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('SVLight Admin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'No. of Democracies: ${model.democs.length}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: RaisedButton.icon(
                label: Text('push'),
                icon: Icon(Icons.personal_video),
                onPressed: () => dispatch(Nop()),
              ),
            )
          ],
        ),
      ));
}

class SvSub {}
