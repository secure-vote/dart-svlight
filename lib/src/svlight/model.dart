import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:functional_data/functional_data.dart';
import 'package:meta/meta.dart';
import 'package:svlight/svlight.dart';

part 'model.g.dart';

@FunctionalData()
class SvModel extends $SvModel {
  final BuiltMap<Uint8List, Democ> democs;
  final BuiltMap<Uint8List, DemocAttrs> democAttrs;
  final SvCoreContracts svcc;

  const SvModel({@required this.democs, @required this.democAttrs, this.svcc});
}

@FunctionalData()
class Democ extends $Democ {
  final int nBallots;
  final BuiltList<Ballot> ballots;

  const Democ({@required this.ballots, @required this.nBallots});
}

@FunctionalData()
class DemocAttrs extends $DemocAttrs {
  final String name;

  const DemocAttrs({@required this.name});
}

@FunctionalData()
class Ballot extends $Ballot {
  final String title;
  final String shortDesc;
  final String longDesc;
  final String startTime;
  final String endTime;

  Ballot(
      {@required this.title,
      @required this.shortDesc,
      @required this.longDesc,
      @required this.startTime,
      @required this.endTime});
}
