import 'package:flutter/material.dart';
import 'package:moneytrail/models/category_data_model.dart';
import 'package:moneytrail/models/transaction.dart' as tx;
import 'package:moneytrail/services/controllers/profile_controller.dart';
import 'package:moneytrail/services/repositories/database.dart';
import 'package:moneytrail/utilites/add_new_transaction.dart';

class TransactionController with ChangeNotifier {
  TransactionController({required this.dbService});
  CategoryDataModel? categoryDataModel;
  final DatabaseService dbService;
  List<tx.Transaction> userTransactionList = [];
  Future getAllTransactions() async {
    userTransactionList = await dbService.getAllTransactions();
    notifyListeners();
  }

  void getCatgeoryData() async {
    categoryDataModel = await dbService.getCategoryData();
    notifyListeners();
  }

  Future addTransaction({required tx.Transaction newTransaction}) async {
    await dbService.addTx(tx: newTransaction);
    notifyListeners();
  }
  Future addTransactionMsg({required tx.Transaction newTransaction}) async {
    await dbService.addTx(tx: newTransaction, readingMsg: true);
    notifyListeners();
  }

  void updateCategory() {}
}
