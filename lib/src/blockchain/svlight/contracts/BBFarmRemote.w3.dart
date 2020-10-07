// autogenerated - your edits will be overwritten!
import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3_contract_generator/helpers.dart';

const BBFARMREMOTE_ABI =
    """[{"constant":true,"inputs":[{"name":"ballotId","type":"uint256"}],"name":"getCreationTs","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"ballotId","type":"uint256"},{"name":"vote","type":"bytes32"},{"name":"extra","type":"bytes"}],"name":"submitVote","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"ballotId","type":"uint256"},{"name":"newOwner","type":"address"}],"name":"setBallotOwner","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"ballotId","type":"uint256"}],"name":"setDeprecated","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"getVersion","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"pure","type":"function"},{"constant":false,"inputs":[],"name":"doLockdown","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"newOwner","type":"address"}],"name":"setOwner","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"getNBallots","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"a","type":"address"}],"name":"hasPermissions","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"n","type":"uint256"}],"name":"getAdminLog","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"a","type":"address"}],"name":"isAdmin","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getNamespace","outputs":[{"name":"","type":"bytes4"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"ballotId","type":"uint256"}],"name":"getSponsorsN","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"ballotId","type":"uint256"},{"name":"sponsorN","type":"uint256"}],"name":"getSponsor","outputs":[{"name":"sender","type":"address"},{"name":"amount","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getNetworkId","outputs":[{"name":"","type":"bytes32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"currAdminEpoch","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getAdminLogN","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[],"name":"incAdminEpoch","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"ballotId","type":"uint256"},{"name":"voteId","type":"uint256"}],"name":"getVote","outputs":[{"name":"voteData","type":"bytes32"},{"name":"sender","type":"address"},{"name":"extra","type":"bytes"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"a","type":"address"},{"name":"_givePerms","type":"bool"}],"name":"setAdmin","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[],"name":"payoutAll","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"newSC","type":"address"}],"name":"upgradeMe","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"adminsDisabledForever","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"proxyReq","type":"bytes32[5]"},{"name":"extra","type":"bytes"}],"name":"submitProxyVote","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[{"name":"ballotId","type":"uint256"}],"name":"getTotalSponsorship","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"e","type":"address"},{"name":"_editPerms","type":"bool"}],"name":"setPermissions","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"adminLockdown","outputs":[{"name":"","type":"bool"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"newAdmin","type":"address"}],"name":"upgradeMeAdmin","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":true,"inputs":[],"name":"owner","outputs":[{"name":"","type":"address"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"ballotId","type":"uint256"},{"name":"voter","type":"address"}],"name":"getDetails","outputs":[{"name":"hasVoted","type":"bool"},{"name":"nVotesCast","type":"uint256"},{"name":"secKey","type":"bytes32"},{"name":"submissionBits","type":"uint16"},{"name":"startTime","type":"uint64"},{"name":"endTime","type":"uint64"},{"name":"specHash","type":"bytes32"},{"name":"deprecated","type":"bool"},{"name":"ballotOwner","type":"address"},{"name":"extraData","type":"bytes16"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"ballotId","type":"uint256"},{"name":"sk","type":"bytes32"}],"name":"revealSeckey","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"v","type":"uint8"},{"name":"r","type":"bytes32"},{"name":"s","type":"bytes32"},{"name":"params","type":"bytes32[4]"}],"name":"initBallotProxy","outputs":[{"name":"ballotId","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"ballotId","type":"uint256"},{"name":"newEndTime","type":"uint64"}],"name":"setEndTime","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"oldSC","type":"address"},{"name":"newSC","type":"address"}],"name":"upgradePermissionedSC","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"constant":false,"inputs":[{"name":"ballotId","type":"uint256"}],"name":"sponsor","outputs":[],"payable":true,"stateMutability":"payable","type":"function"},{"constant":true,"inputs":[{"name":"ballotId","type":"uint256"},{"name":"voter","type":"address"}],"name":"getSequenceNumber","outputs":[{"name":"sequence","type":"uint32"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"getBBLibVersion","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"specHash","type":"bytes32"},{"name":"packed","type":"uint256"},{"name":"ix","type":"address"},{"name":"bbAdmin","type":"address"},{"name":"extraData","type":"bytes24"}],"name":"initBallot","outputs":[{"name":"ballotId","type":"uint256"}],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[{"name":"_namespace","type":"bytes4"},{"name":"ix","type":"address"}],"payable":false,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"payTo","type":"address"},{"indexed":false,"name":"value","type":"uint256"}],"name":"PayoutAll","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"editAddr","type":"address"}],"name":"PermissionError","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"editAddr","type":"address"}],"name":"PermissionGranted","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"editAddr","type":"address"}],"name":"PermissionRevoked","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"oldSC","type":"address"},{"indexed":false,"name":"newSC","type":"address"}],"name":"PermissionsUpgraded","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"oldSC","type":"address"},{"indexed":false,"name":"newSC","type":"address"}],"name":"SelfUpgrade","type":"event"},{"anonymous":false,"inputs":[],"name":"AdminLockdown","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"newAdmin","type":"address"}],"name":"AdminAdded","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"oldAdmin","type":"address"}],"name":"AdminRemoved","type":"event"},{"anonymous":false,"inputs":[],"name":"AdminEpochInc","type":"event"},{"anonymous":false,"inputs":[],"name":"AdminDisabledForever","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"newOwner","type":"address"}],"name":"OwnerChanged","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"ballotId","type":"uint256"}],"name":"BallotCreatedWithID","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"namespace","type":"bytes4"}],"name":"BBFarmInit","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"ballotId","type":"uint256"},{"indexed":false,"name":"value","type":"uint256"}],"name":"Sponsorship","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"name":"ballotId","type":"uint256"},{"indexed":false,"name":"vote","type":"bytes32"},{"indexed":false,"name":"voter","type":"address"},{"indexed":false,"name":"extra","type":"bytes"}],"name":"Vote","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"networkId","type":"bytes32"},{"indexed":false,"name":"ballotId","type":"uint256"}],"name":"BallotOnForeignNetwork","type":"event"}]""";
final EthereumAddress _zeroAddr =
    EthereumAddress(Uint8List(20)..fillRange(0, 20, 0));
EthereumAddress _addrOrDefault(EthereumAddress addr) => addr ?? _zeroAddr;

class BBFarmRemoteContract {
  final ContractAbi $abi =
      ContractAbi.fromJson(BBFARMREMOTE_ABI, "BBFarmRemote");
  EthereumAddress $addr;
  DeployedContract $contract;
  Web3Client $client;
  BBFarmRemoteContract(String address, Web3Client this.$client) {
    $addr = EthereumAddress.fromHex(address);
    $contract = DeployedContract($abi, $addr);
  }

  Future<BigInt> getCreationTs(BigInt ballotId, {EthereumAddress from}) async {
    var _f = $contract.function("getCreationTs");
    var _params = <dynamic>[ballotId];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as BigInt;
  }

  Future<String> submitVote(BigInt ballotId, Uint8List vote, Uint8List extra,
      Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("submitVote");
    var _params = _f.encodeCall(<dynamic>[ballotId, vote, extra]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> setBallotOwner(BigInt ballotId, EthereumAddress newOwner,
      Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("setBallotOwner");
    var _params = _f.encodeCall(<dynamic>[ballotId, newOwner]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> setDeprecated(
      BigInt ballotId, Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("setDeprecated");
    var _params = _f.encodeCall(<dynamic>[ballotId]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<BigInt> getVersion({EthereumAddress from}) async {
    var _f = $contract.function("getVersion");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as BigInt;
  }

  Future<String> doLockdown(Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("doLockdown");
    var _params = _f.encodeCall(<dynamic>[]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
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

  Future<BigInt> getNBallots({EthereumAddress from}) async {
    var _f = $contract.function("getNBallots");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as BigInt;
  }

  Future<bool> hasPermissions(EthereumAddress a, {EthereumAddress from}) async {
    var _f = $contract.function("hasPermissions");
    var _params = <dynamic>[a];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as bool;
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

  Future<Uint8List> getNamespace({EthereumAddress from}) async {
    var _f = $contract.function("getNamespace");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as Uint8List;
  }

  Future<BigInt> getSponsorsN(BigInt ballotId, {EthereumAddress from}) async {
    var _f = $contract.function("getSponsorsN");
    var _params = <dynamic>[ballotId];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as BigInt;
  }

  Future<Tuple2<EthereumAddress, BigInt>> getSponsor(
      BigInt ballotId, BigInt sponsorN,
      {EthereumAddress from}) async {
    var _f = $contract.function("getSponsor");
    var _params = <dynamic>[ballotId, sponsorN];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return Tuple2(result[0] as EthereumAddress, result[1] as BigInt);
  }

  Future<Uint8List> getNetworkId({EthereumAddress from}) async {
    var _f = $contract.function("getNetworkId");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as Uint8List;
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

  Future<Tuple3<Uint8List, EthereumAddress, Uint8List>> getVote(
      BigInt ballotId, BigInt voteId,
      {EthereumAddress from}) async {
    var _f = $contract.function("getVote");
    var _params = <dynamic>[ballotId, voteId];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return Tuple3(result[0] as Uint8List, result[1] as EthereumAddress,
        result[2] as Uint8List);
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

  Future<String> payoutAll(Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("payoutAll");
    var _params = _f.encodeCall(<dynamic>[]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> upgradeMe(
      EthereumAddress newSC, Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("upgradeMe");
    var _params = _f.encodeCall(<dynamic>[newSC]);
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

  Future<String> submitProxyVote(FixedLengthArray<dynamic> proxyReq,
      Uint8List extra, Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("submitProxyVote");
    var _params = _f.encodeCall(<dynamic>[proxyReq, extra]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<BigInt> getTotalSponsorship(BigInt ballotId,
      {EthereumAddress from}) async {
    var _f = $contract.function("getTotalSponsorship");
    var _params = <dynamic>[ballotId];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as BigInt;
  }

  Future<String> setPermissions(EthereumAddress e, bool _editPerms,
      Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("setPermissions");
    var _params = _f.encodeCall(<dynamic>[e, _editPerms]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<bool> adminLockdown({EthereumAddress from}) async {
    var _f = $contract.function("adminLockdown");
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

  Future<
      Tuple10<
          bool,
          BigInt,
          Uint8List,
          BigInt,
          BigInt,
          BigInt,
          Uint8List,
          bool,
          EthereumAddress,
          Uint8List>> getDetails(BigInt ballotId, EthereumAddress voter,
      {EthereumAddress from}) async {
    var _f = $contract.function("getDetails");
    var _params = <dynamic>[ballotId, voter];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return Tuple10(
        result[0] as bool,
        result[1] as BigInt,
        result[2] as Uint8List,
        result[3] as BigInt,
        result[4] as BigInt,
        result[5] as BigInt,
        result[6] as Uint8List,
        result[7] as bool,
        result[8] as EthereumAddress,
        result[9] as Uint8List);
  }

  Future<String> revealSeckey(BigInt ballotId, Uint8List sk, Wallet wallet,
      TransactionNotPayable tx) async {
    var _f = $contract.function("revealSeckey");
    var _params = _f.encodeCall(<dynamic>[ballotId, sk]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> initBallotProxy(
      BigInt v,
      Uint8List r,
      Uint8List s,
      FixedLengthArray<dynamic> params,
      Wallet wallet,
      TransactionNotPayable tx) async {
    var _f = $contract.function("initBallotProxy");
    var _params = _f.encodeCall(<dynamic>[v, r, s, params]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> setEndTime(BigInt ballotId, BigInt newEndTime, Wallet wallet,
      TransactionNotPayable tx) async {
    var _f = $contract.function("setEndTime");
    var _params = _f.encodeCall(<dynamic>[ballotId, newEndTime]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> upgradePermissionedSC(EthereumAddress oldSC,
      EthereumAddress newSC, Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("upgradePermissionedSC");
    var _params = _f.encodeCall(<dynamic>[oldSC, newSC]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> sponsor(
      BigInt ballotId, Wallet wallet, TransactionPayable tx) async {
    var _f = $contract.function("sponsor");
    var _params = _f.encodeCall(<dynamic>[ballotId]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<BigInt> getSequenceNumber(BigInt ballotId, EthereumAddress voter,
      {EthereumAddress from}) async {
    var _f = $contract.function("getSequenceNumber");
    var _params = <dynamic>[ballotId, voter];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as BigInt;
  }

  Future<BigInt> getBBLibVersion({EthereumAddress from}) async {
    var _f = $contract.function("getBBLibVersion");
    var _params = <dynamic>[];
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: _params,
        atBlock: BlockNum.current());
    return result[0] as BigInt;
  }

  Future<String> initBallot(
      Uint8List specHash,
      BigInt packed,
      EthereumAddress ix,
      EthereumAddress bbAdmin,
      Uint8List extraData,
      Wallet wallet,
      TransactionNotPayable tx) async {
    var _f = $contract.function("initBallot");
    var _params =
        _f.encodeCall(<dynamic>[specHash, packed, ix, bbAdmin, extraData]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> $constructor(Uint8List _namespace, EthereumAddress ix,
      Wallet wallet, TransactionNotPayable tx) async {
    var _f = $abi.functions.where((f) => f.name == "" && f.isConstructor).first;
    var _params = _f.encodeCall(<dynamic>[_namespace, ix]);
    var finalized = tx.finalize(
        data: _params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }
}
