import 'dart:typed_data';

import 'package:svlight/svlight.dart';

abstract class Msg {}

class Nop implements Msg {}

class SetSvCoreAndDemocs implements Msg {
  final Map<String, Uint8List> democHashes;
  final SvCoreContracts svcc;

  SetSvCoreAndDemocs(this.svcc, this.democHashes);
}

// class GotIxNBallotsMsg implements Msg {
//   final String democHash;
//   final BigInt nBallots;

//   GotIxNBallotsMsg(this.democHash, this.nBallots);
// }

class GotIxBallotsMsg implements Msg {
  final Uint8List democHash;
  final List<BigInt> ballots;

  GotIxBallotsMsg(this.democHash, this.ballots);
}
