import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;
import 'package:args/args.dart';
import 'package:crypto/crypto.dart';
import 'package:logging/logging.dart';
import 'package:svlight/src/ballotspec/types.dart';
import 'package:svlight/src/svlight/data.dart';
import 'package:svlight/svlight.dart';
import 'package:web3_contract/web3_contract.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

const ARCHIVE_GET_URL = "https://archive.secure.vote/";
const ARCHIVE_PUSH_URL = "https://archive.push.secure.vote/";
const ARCHIVE_PUSH_API_KEY = "UmNrB7cifZ2N1LlnyM4RXK1xuK2VpIQaamgmlSBb";

//Logger.root.level = Level.INFO;
var log = Logger("svlight");

ArgResults parseArgs(List<String> args) {
  var parser = ArgParser()..addOption('command');
  return parser.parse(args);
}

void main(List<String> args) async {
  var argRes = parseArgs(args);
  var nowMs = DateTime.now().millisecondsSinceEpoch;

  var web3 = Web3Client(WEB3_PROVIDER, http.Client());
  var svCoreCs = await getSvContracts(web3);
  var svCreds = SvCredentials();
  await svCreds.printAddrs();
  var democHashAus = hexToBytes(DEMOC_HASHES["AUS"]);
  print(
      """democMgmtIsDEditor: ${await svCoreCs.backend.isDEditor(democHashAus, await svCreds.democManagement.extractAddress())}""");
  print(
      """publisherIsDEditor: ${await svCoreCs.backend.isDEditor(democHashAus, await svCreds.rootAdmin.extractAddress())}""");

  // var democOkay = await svCoreCs.payments.getSecondsRemaining(democHashAus);
  print("payments addr: ${svCoreCs.payments.$addr}");
  print("backend addr: ${svCoreCs.backend.$addr}");
  print("bbfarm addr: ${await svCoreCs.ix.getBBFarm(BigInt.from(0))}");

  // return;

  var bsHash = await doTestBallot(nowMs);
  var txr = await deployBallot(web3, svCoreCs, svCreds, democHashAus, bsHash,
      nowMs ~/ 1000 - 60, nowMs ~/ 1000 + 86400 * 7);
  print("txrJson: ${txrToJson(txr)}");
  print("txr: $txr");
}

Future<TransactionReceipt> deployBallot(
    Web3Client web3,
    SvCoreContracts svCoreCs,
    SvCredentials svCreds,
    Uint8List democHash,
    String bsHash,
    int startTime,
    int endTime) async {
  var deployTxid = await svCoreCs.ix.dDeployBallot(
      democHash,
      hexToBytes(bsHash),
      Uint8List(32)..setRange(0, 1, [0x00]),
      mkPacked(
          startTime, endTime, mkSubmissionBits(useEth: true, useNoEnc: true)),
      svCreds.democManagement,
      TransactionPayable(value: EtherAmount.zero()));
  log.info("Deploy ballot txid: $deployTxid");
  var txr = await waitForTxReceipt(web3, deployTxid);
  return txr;
}

Future<String> doTestBallot(int nowMs) async {
  var bs = BallotSpecV2(
      BallotInner("test-$nowMs", "short: $nowMs", "long: $nowMs",
          discussionLink: "https://forum.voteflux.org"),
      OptionsYesNoInner());
  var bsStr = jsonEncode(bs);
  print('Got serialized ballot spec: $bsStr');
  var bsHash = await postBallotSpecHash(bsStr);
  print("ballotSpecHash: $bsHash");
  return bsHash;
}

String calcBallotSpecHash(String ballotSpec) {
  var digest = sha256.convert(utf8.encode(ballotSpec));
  return '0x$digest';
}

Future<String> postBallotSpecHash(String ballotSpec) async {
  var ballotSpecHash = calcBallotSpecHash(ballotSpec);
  var payload = {
    'assertSpecHash': ballotSpecHash,
    'ballotBase64': base64.encode(utf8.encode(ballotSpec))
  };
  var resp = await http.post(ARCHIVE_PUSH_URL,
      headers: {
        "X-Api-Key": ARCHIVE_PUSH_API_KEY,
        "Content-Type": "application/json",
      },
      body: jsonEncode(payload));
  print(resp.body);
  print(resp.statusCode);
  print(resp.headers);
  print('Uploaded: ${p.join(ARCHIVE_GET_URL, "$ballotSpecHash.json")}');
  return ballotSpecHash;
  // header - X-Api-Key: UmNrB7cifZ2N1LlnyM4RXK1xuK2VpIQaamgmlSBb
}
