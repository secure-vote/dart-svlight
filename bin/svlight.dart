import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:http/http.dart' as http;
import 'package:args/args.dart';
import 'package:crypto/crypto.dart';
import 'package:logging/logging.dart';

const ARCHIVE_GET_URL = "https://archive.secure.vote/";
const ARCHIVE_PUSH_URL = "https://archive.push.secure.vote/";
const ARCHIVE_PUSH_API_KEY = "UmNrB7cifZ2N1LlnyM4RXK1xuK2VpIQaamgmlSBb";

//Logger.root.level = Level.INFO;
var log = Logger("svlight");

ArgResults parseArgs(List<String> args) {
  var parser = ArgParser()..addOption('command');
  return parser.parse(args);
}

void main(List<String> args) {
  var argRes = parseArgs(args);
  var nowMs = DateTime.now().millisecondsSinceEpoch;
  postBallotSpecHash(jsonEncode({
    "ballotVersion": 2,
    "ballotInner": {
      "ballotTitle": "test-$nowMs",
      "shortDesc": "short: $nowMs",
      "longDesc": "long: $nowMs",
      "discussionLink": "https://voteflux.org",
      "encryptionPK": null,
    },
    "optionsVersion": 2,
    "optionsInner": {
      "options": null,
    },
  }));
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
