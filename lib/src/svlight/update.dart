import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:svlight/src/dartea/dartea.dart';
import 'package:logging/logging.dart';
import 'package:svlight/svlight.dart';

import 'model.dart';
import 'msg.dart';

final log = Logger('svlight/tea/update');

Upd<SvModel, Msg> update(Msg msg, SvModel model) {
  var ret = _svUpdate(msg, model);
  debugPrint(
      'update returning:\n\nMODEL:\n${ret.model}\n\nEFFECTS:\n${ret.effects}');
  return ret;
}

Upd<SvModel, Msg> _svUpdate(Msg msg, SvModel model) {
  debugPrint('got msg: ${msg} and model: ${model}');
  if (msg is GotIxBallotsMsg) {
    return Upd(SvModel$.democs.map((d) {}, model));
  }

  if (msg is SetSvCoreAndDemocs) {
    var dhEntries = msg.democHashes.entries.toList();
    var m2 = model.copyWith(
        svcc: msg.svcc,
        democs: dhEntries.fold(
            model.democs,
            (ds, entry) => (ds.toBuilder()
                  ..addEntries([
                    MapEntry(
                        entry.value, Democ(ballots: BuiltList(), nBallots: 0))
                  ]))
                .build()),
        // .update(SvModel$.democs),
        democAttrs: SvModel$.democAttrs
            .update(
                model,
                BuiltMap<String, Uint8List>.from(msg.democHashes).map(
                    (key, value) => MapEntry(value, DemocAttrs(name: key))))
            .democAttrs);
    return Upd(m2,
        effects: cmdGetBallotIDs(m2, dhEntries.map((e) => e.value).toList()));
  }

  log.warning('Unknown Msg type: ${msg.runtimeType.toString()}');
  debugPrint('Unknown Msg type: ${msg.runtimeType.toString()}');
  return Upd(model, effects: Cmd.none());
}

Future<List<BigInt>> getDemocBallots(SvModel model, Uint8List dHash) async {
  while (model.svcc == null) {
    await Future<void>.delayed(Duration(milliseconds: 10));
  }
  debugPrint('getDemocBallots: ${dHash}');
  var nBallots = (await model.svcc.backend.getDBallotsN(dHash)).toInt();
  var ballotIDs = await Future.wait(Iterable<int>.generate(nBallots)
      .map((n) => model.svcc.backend.getDBallotID(dHash, BigInt.from(n))));
  return ballotIDs;
}

Cmd<Msg> cmdGetBallotIDs(SvModel model, List<Uint8List> dHashes) =>
    Cmd.batch(dHashes
        .map((e) => Cmd.ofAsyncFunc<List<BigInt>, Msg>(
            () async => await getDemocBallots(model, e),
            onSuccess: (ballotIDs) => GotIxBallotsMsg(e, ballotIDs)))
        .toList());

//Upd<SvModel, Msg>

// final SV_UPDATE_FUNCTIONS = <T extends Msg>(Msg msg, SvModel model) =>
//     <Type, Upd<SvModel, Msg> Function(T msg, SvModel model)>{

class SvUpdates {
  Upd<SvModel, Msg> update(GotIxBallotsMsg msg, SvModel model) {}

  Upd<SvModel, Msg> update(SetSvCoreAndDemocs msg, SvModel model) {}
}
