import 'package:http/http.dart';
import 'package:svlight/src/blockchain/svlight/contracts/SVIndex.w3.dart';
import 'package:svlight/src/blockchain/svlight/contracts/SVIndexBackend.w3.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

const WEB3_PROVIDER = "http://3.24.234.52:8545";
const SV_INDEX_ADDR = "0x813552517e36b4D8c5e8c7CA8c184Af5c314ecf2";
const SV_AUX_ADDR = "0x66e6aC2e8FA898003Fc1A0a2b5557f6526C2D76E";
const SV_API_ENDPOINT = "https://api.blockchain.suzuka.flux.party/";
const SV_TOKEN_LOOKUP = "0x8ee026Bbbae598145B2206Df74050811BF2e6a76";
const DEMOC_HASHES = <String, String>{
  "AUS": "0xb7a3bf2ddb4ae293770fd1e7e9697b165559c1986953d0352303ba4459b0cbd4",
  "WA": "",
};

void main() async {
  var democHash = hexToBytes(DEMOC_HASHES["AUS"]);
  var web3 = Web3Client(WEB3_PROVIDER, Client(), enableBackgroundIsolate: true);
  var ix = SVIndexContract(SV_INDEX_ADDR, web3);
  var ixBackendAddr = await ix.getBackend();
  print('ixBackendAddress: ${ixBackendAddr}');
  var backend = SVIndexBackendContract(ixBackendAddr.hex, web3);
  var nBallots = await backend.getDBallotsN(democHash);
  print('nBallots (${nBallots} :: ${nBallots.runtimeType}) in ${democHash}');
  var ballotSpecHashes = Future.forEach(
      Iterable<int>.generate(nBallots.toInt()),
      (int i) => backend.getDBallotID(democHash, BigInt.from(i)));
  print('ballotSpecHashes: ${ballotSpecHashes}');
}
