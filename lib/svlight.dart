import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:path/path.dart' as p;
import 'package:http/http.dart';
import 'package:svlight/src/ballotspec/types.dart';
import 'package:svlight/src/svlight/contracts/SVIndex.w3.dart';
import 'package:svlight/src/svlight/contracts/SVIndexBackend.w3.dart';
import 'package:svlight/src/svlight/contracts/SVPayments.w3.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:yaml/yaml.dart';

const WEB3_PROVIDER = "http://3.24.234.52:8545";
const SV_INDEX_ADDR = "0x813552517e36b4D8c5e8c7CA8c184Af5c314ecf2";
const SV_AUX_ADDR = "0x66e6aC2e8FA898003Fc1A0a2b5557f6526C2D76E";
const SV_API_ENDPOINT = "https://api.blockchain.suzuka.flux.party/";
const SV_TOKEN_LOOKUP = "0x8ee026Bbbae598145B2206Df74050811BF2e6a76";
const DEMOC_HASHES = <String, String>{
  "AUS": "0xb7a3bf2ddb4ae293770fd1e7e9697b165559c1986953d0352303ba4459b0cbd4",
  "WA": "",
};
Map<String, Uint8List> DEMOC_HASHES_BYTES = DEMOC_HASHES.map(
    (key, value) => MapEntry(key, hexToBytes(value))); // <String, Uint8List>

class SvLightCredentialsError implements Exception {
  SvLightCredentialsError([String s]) {}
}

class SvCoreContracts {
  SVIndexContract ix;
  SVIndexBackendContract backend;
  SVPaymentsContract payments;
  SvCoreContracts(this.ix, this.backend, this.payments);
}

class SvCredentials {
  EthPrivateKey publish;
  SvCredentials() {
    var homeDir =
        Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];
    var credsPath = p.joinAll([homeDir, '.svlight', 'credentials']);
    var credsYaml =
        loadYaml(File(credsPath).readAsStringSync()) as Map<String, dynamic>;
    if (!credsYaml.containsKey('publish')) {
      throw SvLightCredentialsError(
          'The key `publish` is missing from ~/.svlight/credentials file.');
    }
    var privateKey = hexToBytes(credsYaml['publish'] as String);
    publish = EthPrivateKey(privateKey);
  }
}

Future<SvCoreContracts> getSvContracts(Web3Client web3) async {
  var ix = SVIndexContract(SV_INDEX_ADDR, web3);
  var backendFut =
      ix.getBackend().then((addr) => SVIndexBackendContract(addr.hex, web3));
  var paymentsFut =
      ix.getPayments().then((addr) => SVPaymentsContract(addr.hex, web3));
  return SvCoreContracts(ix, await backendFut, await paymentsFut);
}

Future publishBallotSpec(
  Web3Client web3,
  BallotSpecV2 ballotSpec,
) async {
  var bsEncoded = jsonEncode(ballotSpec);
  print('bsEncoded: $bsEncoded');
}

void main() async {
  var democHash = hexToBytes(DEMOC_HASHES["AUS"]);
  var web3 = Web3Client(WEB3_PROVIDER, Client(), enableBackgroundIsolate: true);
  var coreContracts = await getSvContracts(web3);
  // var ix = coreContracts.value1;
  var backend = coreContracts.backend;
  var nBallots = await backend.getDBallotsN(democHash);
  print('nBallots ($nBallots :: ${nBallots.runtimeType}) in $democHash');
  var ballotSpecHashes = await Future.wait(
      Iterable<int>.generate(nBallots.toInt())
          .map((int i) => backend.getDBallotID(democHash, BigInt.from(i))));
  print('ballotSpecHashes: $ballotSpecHashes');
}
