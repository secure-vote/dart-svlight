import 'dart:math';
import 'dart:typed_data';

import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

final BigInt max64Bit = BigInt.from(0xffffffffffffffff);
final BigInt max16Bit = BigInt.from(0xffff);

// flags on submission methods
int USE_ETH = 1;
int USE_SIGNED = 2;
int USE_NO_ENC = 4;
int USE_ENC = 8;

// other ballot settings
int IS_BINDING = 8192;
int IS_OFFICIAL = 16384;
int USE_TESTING = 32768;

BigInt mkPacked(int start, int end, BigInt submissionBits) {
  BigInt _start = BigInt.from(start);
  var _end = BigInt.from(end);
  assert(BigInt.zero <= _start && _start <= max64Bit);
  assert(BigInt.zero <= _end && _end <= max64Bit);
  assert(BigInt.zero <= submissionBits && submissionBits <= max64Bit);
  return (((submissionBits << 64) + _start) << 64) + _end;
}

BigInt mkSubmissionBits(
    {bool useEth: true,
    bool useSigned: false,
    bool useNoEnc: true,
    bool useEnc: false,
    bool isBinding: false,
    bool isOfficial: false,
    bool useTesting: false}) {
  assert(useEth ^ useSigned);
  assert(useNoEnc ^ useEnc);
  return BigInt.from(
    (useEth ? USE_ETH : 0) |
        (useSigned ? USE_SIGNED : 0) |
        (useNoEnc ? USE_NO_ENC : 0) |
        (useEnc ? USE_ENC : 0) |
        (isBinding ? IS_BINDING : 0) |
        (isOfficial ? IS_OFFICIAL : 0) |
        (useTesting ? USE_TESTING : 0),
  );
}

Map<String, dynamic> txrToJson(TransactionReceipt txr) {
  return <String, dynamic>{
    'blockHash': bytesToHex(txr.blockHash),
    'blockNumber': txr.blockNumber,
    'contractAddress': txr.contractAddress,
    'cumulativeGasUsed': txr.cumulativeGasUsed,
    'from': txr.from,
    'gasUsed': txr.gasUsed,
    'status': txr.status,
    'to': txr.to,
    'transactionHash': bytesToHex(txr.transactionHash),
    'transactionIndex': txr.transactionIndex,
  };
}

Future<String> getRevertReason(Web3Client web3, String txid) async {
  var tx = await web3.getTransactionByHash(txid);
  var rawCallRes = await web3.callRaw(
      contract: tx.to,
      data: tx.input,
      sender: tx.from,
      atBlock: tx.blockNumber);
  print(rawCallRes);
  return rawCallRes;
}
