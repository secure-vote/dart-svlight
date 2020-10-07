// autogenerated - your edits will be overwritten!
import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3_contract_generator/helpers.dart';

const ENSOWNERPROXY_ABI =
    """[{"constant":true,"inputs":[],"name":"resolver","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"newOwner","type":"address"}],"name":"setOwner","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"n","type":"uint256"}],"name":"getAdminLog","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"a","type":"address"}],"name":"isAdmin","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"data","type":"bytes"}],"name":"fwdToResolver","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"currAdminEpoch","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"ens","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getAdminLogN","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"incAdminEpoch","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"a","type":"address"},{"name":"_givePerms","type":"bool"}],"name":"setAdmin","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"adminsDisabledForever","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"newAdmin","type":"address"}],"name":"upgradeMeAdmin","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"returnToOwner","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"data","type":"bytes"}],"name":"fwdToENS","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"addr","type":"address"}],"name":"setAddr","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"ensNode","outputs":[{"name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"inputs":[{"name":"_ensNode","type":"bytes32"},{"name":"_ens","type":"address"},{"name":"_resolver","type":"address"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"name":"newAdmin","type":"address"}],"name":"AdminAdded","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"oldAdmin","type":"address"}],"name":"AdminRemoved","type":"event"},{"anonymous":false,"inputs":[],"name":"AdminEpochInc","type":"event"},{"anonymous":false,"inputs":[],"name":"AdminDisabledForever","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"newOwner","type":"address"}],"name":"OwnerChanged","type":"event"}]""";
final EthereumAddress _zeroAddr =
    EthereumAddress(Uint8List(20)..fillRange(0, 20, 0));
EthereumAddress _addrOrDefault(EthereumAddress addr) => addr ?? _zeroAddr;

class EnsOwnerProxyContract {
  final ContractAbi $abi =
      ContractAbi.fromJson(ENSOWNERPROXY_ABI, "EnsOwnerProxy");
  EthereumAddress $addr;
  DeployedContract $contract;
  Web3Client $client;
  EnsOwnerProxyContract(String address, Web3Client this.$client) {
    $addr = EthereumAddress.fromHex(address);
    $contract = DeployedContract($abi, $addr);
  }

  Future<EthereumAddress> resolver({EthereumAddress from}) async {
    var _f = $contract.function("resolver");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as EthereumAddress;
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

  Future<EthereumAddress> getAdminLog(BigInt n, {EthereumAddress from}) async {
    var _f = $contract.function("getAdminLog");
    var _params = <dynamic>[n];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as EthereumAddress;
  }

  Future<bool> isAdmin(EthereumAddress a, {EthereumAddress from}) async {
    var _f = $contract.function("isAdmin");
    var _params = <dynamic>[a];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as bool;
  }

  Future<String> fwdToResolver(
      Uint8List data, Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("fwdToResolver");
    var _params = _f.encodeCall(<dynamic>[data]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<BigInt> currAdminEpoch({EthereumAddress from}) async {
    var _f = $contract.function("currAdminEpoch");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as BigInt;
  }

  Future<EthereumAddress> ens({EthereumAddress from}) async {
    var _f = $contract.function("ens");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as EthereumAddress;
  }

  Future<BigInt> getAdminLogN({EthereumAddress from}) async {
    var _f = $contract.function("getAdminLogN");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as BigInt;
  }

  Future<String> incAdminEpoch(Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("incAdminEpoch");
    var _params = _f.encodeCall(<dynamic>[]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> setAdmin(EthereumAddress a, bool _givePerms, Wallet wallet,
      TransactionNotPayable tx) async {
    var _f = $contract.function("setAdmin");
    var _params = _f.encodeCall(<dynamic>[a, _givePerms]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<bool> adminsDisabledForever({EthereumAddress from}) async {
    var _f = $contract.function("adminsDisabledForever");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as bool;
  }

  Future<String> upgradeMeAdmin(
      EthereumAddress newAdmin, Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("upgradeMeAdmin");
    var _params = _f.encodeCall(<dynamic>[newAdmin]);
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

  Future<String> returnToOwner(Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("returnToOwner");
    var _params = _f.encodeCall(<dynamic>[]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> fwdToENS(
      Uint8List data, Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("fwdToENS");
    var _params = _f.encodeCall(<dynamic>[data]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> setAddr(
      EthereumAddress addr, Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("setAddr");
    var _params = _f.encodeCall(<dynamic>[addr]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<Uint8List> ensNode({EthereumAddress from}) async {
    var _f = $contract.function("ensNode");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as Uint8List;
  }

  Future<String> $constructor(
      Uint8List _ensNode,
      EthereumAddress _ens,
      EthereumAddress _resolver,
      Wallet wallet,
      TransactionNotPayable tx) async {
    var _f = $abi.functions.where((f) => f.name == "" && f.isConstructor).first;
    var _params = _f.encodeCall(<dynamic>[_ensNode, _ens, _resolver]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }
}
