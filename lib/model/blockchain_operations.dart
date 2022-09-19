import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:password_blocks/constants.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';

class BlockchainOperations {
  Future<DeployedContract> loadBuilderContract() async {
    String contractAbi = await readJson("BuilderContract");
    String contractAddress = BUILDER_CONTRACT_ADDRESS;
    final contract = DeployedContract(
        ContractAbi.fromJson(contractAbi, "BuilderContract"),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<DeployedContract> loadUserPasswordContract(
      Web3Client ethClient) async {
    String contractAbi = await readJson("UserPasswords");
    String contractAddress = await getUserPasswordContractAddress(ethClient);
    final contract = DeployedContract(
        ContractAbi.fromJson(contractAbi, "UserPasswords"),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<List<dynamic>> queryBuilderContract(
      String functionName, List<dynamic> args, Web3Client ethClient) async {
    DeployedContract contract = await loadBuilderContract();
    final ethFunction = contract.findFunctionsByName(functionName).first;
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<List<dynamic>> queryUserPasswordContract(
      String functionName, List<dynamic> args, Web3Client ethClient) async {
    DeployedContract contract = await loadUserPasswordContract(ethClient);
    final ethFunction = contract.findFunctionsByName(functionName).first;
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<List<dynamic>> queryAllUsersCreds(Web3Client ethClient) async {
    List<dynamic> results =
        await queryUserPasswordContract("getCreds", [], ethClient);
    return results;
  }

  Future<dynamic> addCredToUserContract(String description, String username,
      String password, Web3Client ethClient) async {
    dynamic result = await queryUserPasswordContract(
        "addCred", [description, username, password], ethClient);
    return result;
  }

  Future<dynamic> updateUserCredContract(int index, String description,
      String username, String password, Web3Client ethClient) async {
    dynamic result = await queryUserPasswordContract(
        "editCreds", [index, description, username, password], ethClient);
    return result;
  }

  Future<String> getUserPasswordContractAddress(Web3Client ethClient) async {
    List<dynamic> result =
        await queryBuilderContract("getUserPasswordContract", [], ethClient);
    return result[0];
  }

  Future<String> readJson(String contractName) async {
    final String response = await rootBundle
        .loadString('blockchain_module/ethereum/build/$contractName.json');
    final data = await json.decode(response);
    return data["interface"].toString();
  }
}
