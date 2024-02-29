import 'dart:convert';
import 'dart:io';

import 'package:web3dart/web3dart.dart';
import 'package:flutter/services.dart';
import 'package:web_socket_channel/io.dart';
import 'package:http/http.dart' as http;

class ContractLinker {
  final String _rpcUrl = 'http://127.0.0.1:7545';
  final String _wsUrl = 'ws://127.0.0.1:7545';
  final String _privatekey =
      '0xc82b293a70f900ace79a4a60082c5c8e86b2a7bc23dd9880d8d3ea36ca2c5667';
  late Web3Client _web3client;
  ContractLinker() {
    init();
  }

  Future<void> init() async {
    _web3client = await Web3Client(
      _rpcUrl,
      http.Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(_wsUrl).cast<String>();
      },
    );
    await getABI();
    await getCredentials();
    await getDeployedContract();
  }

  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  Future<void> getABI() async {
    String abiFile =
        await rootBundle.loadString('build/contracts/SnakeGame.json');
    var jsonABI = jsonDecode(abiFile);
    _abiCode = ContractAbi.fromJson(jsonEncode(jsonABI['abi']), 'SnakeGame');
    _contractAddress =
        EthereumAddress.fromHex(jsonABI["networks"]["5777"]["address"]);
  }

  late EthPrivateKey _creds;
  Future<void> getCredentials() async {
    _creds = EthPrivateKey.fromHex(_privatekey);
  }

  late DeployedContract _deployedContract;
  late ContractFunction _startGame;
  late ContractFunction _endGame;

  Future<void> getDeployedContract() async {
    _deployedContract = DeployedContract(_abiCode, _contractAddress);
    _startGame = _deployedContract.function('startGame');
    _endGame = _deployedContract.function('endGame');
  }

  Future<void> startGame() async {
    await _web3client.sendTransaction(
        _creds,
        Transaction.callContract(
          contract: _deployedContract,
          function: _startGame,
          parameters: [],
        ));
  }

  Future<void> endGame() async {
    await _web3client.sendTransaction(
        _creds,
        Transaction.callContract(
          contract: _deployedContract,
          function: _endGame,
          parameters: [],
        ));
  }
}
