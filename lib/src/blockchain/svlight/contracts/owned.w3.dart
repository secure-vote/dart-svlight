// autogenerated - your edits will be overwritten!
import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3_contract_generator/helpers.dart';

const OWNED_ABI =
    """[{"constant":false,"inputs":[{"name":"newOwner","type":"address"}],"name":"setOwner","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"newOwner","type":"address"}],"name":"OwnerChanged","type":"event"}]""";
final EthereumAddress _zeroAddr =
    EthereumAddress(Uint8List(20)..fillRange(0, 20, 0));
EthereumAddress _addrOrDefault(EthereumAddress addr) => addr ?? _zeroAddr;

class ownedContract {
  final ContractAbi $abi = ContractAbi.fromJson(OWNED_ABI, "owned");
  EthereumAddress $addr;
  DeployedContract $contract;
  Web3Client $client;
  ownedContract(String address, Web3Client this.$client) {
    $addr = EthereumAddress.fromHex(address);
    $contract = DeployedContract($abi, $addr);
  }

  Future<String> setOwner(
      EthereumAddress newOwner, Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("setOwner");
    var _params = _f.encodeCall(<dynamic>[newOwner]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<EthereumAddress> owner({EthereumAddress from}) async {
    var _f = $contract.function("owner");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as EthereumAddress;
  }

  Future<String> $constructor(Wallet wallet, TransactionNotPayable tx) async {
    var _f = $abi.functions.where((f) => f.name == "" && f.isConstructor).first;
    var _params = _f.encodeCall(<dynamic>[]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }
}
