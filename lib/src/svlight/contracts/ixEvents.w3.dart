// autogenerated - your edits will be overwritten!
import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3_contract_generator/helpers.dart';

const IXEVENTS_ABI =
    """[{"anonymous":false,"inputs":[{"indexed":false,"name":"valAndRemainder","type":"uint256[2]"}],"name":"PaymentMade","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"bbFarmId","type":"uint8"}],"name":"AddedBBFarm","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"setWhat","type":"bytes32"},{"indexed":false,"name":"newSC","type":"address"}],"name":"SetBackend","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"bbFarmId","type":"uint8"}],"name":"DeprecatedBBFarm","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"democHash","type":"bytes32"},{"indexed":false,"name":"ballotId","type":"uint256"}],"name":"CommunityBallot","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"democHash","type":"bytes32"},{"indexed":false,"name":"ballotId","type":"uint256"},{"indexed":false,"name":"packed","type":"uint256"}],"name":"ManuallyAddedBallot","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"ballotId","type":"uint256"}],"name":"BallotCreatedWithID","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"namespace","type":"bytes4"}],"name":"BBFarmInit","type":"event"}]""";
final EthereumAddress _zeroAddr =
    EthereumAddress(Uint8List(20)..fillRange(0, 20, 0));
EthereumAddress _addrOrDefault(EthereumAddress addr) => addr ?? _zeroAddr;

class ixEventsContract {
  final ContractAbi $abi = ContractAbi.fromJson(IXEVENTS_ABI, "ixEvents");
  EthereumAddress $addr;
  DeployedContract $contract;
  Web3Client $client;
  ixEventsContract(String address, Web3Client this.$client) {
    $addr = EthereumAddress.fromHex(address);
    $contract = DeployedContract($abi, $addr);
  }
}