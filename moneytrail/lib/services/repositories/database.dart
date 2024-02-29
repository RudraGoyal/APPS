import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:moneytrail/models/category_data_model.dart';
import 'package:moneytrail/models/transaction_category.dart';
import 'package:moneytrail/models/user_model.dart';
import 'package:moneytrail/services/controllers/auth.dart';
import 'package:provider/provider.dart';
import '../../models/goal.dart';
import '../../models/transaction.dart' as tx;

class DatabaseService {
  String? uid;
  late DocumentReference<Map<String, dynamic>> userTransactions;
  late DocumentReference<Map<String, dynamic>> userGoals;
  late DocumentSnapshot<Object?> categoryData;
  final FlutterSecureStorage fss;
  DatabaseService({required this.fss});
  final CollectionReference transactions =
      FirebaseFirestore.instance.collection('transactions');
  final CollectionReference category =
      FirebaseFirestore.instance.collection('category');
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference goals =
      FirebaseFirestore.instance.collection('goals');

  //intialiser
  Future getData() async {
    print('inside database wala getData');
    await getUid();
    userTransactions =
        await transactions.doc(uid).collection('userTransactions').doc();
    userGoals = await goals.doc(uid).collection('userGoals').doc();
  }

  Future getUid() async {
    uid = await fss.read(key: 'uid');
    print('uid is $uid');
  }

  //UsersInitialisation
  Future<UserModel> setNewUserInfo({required String userName}) async {
    await getUid();
    UserModel newUser = UserModel(
      messagesReadingDate: DateTime.now(),
      userName: userName,
      creationDate: DateTime.now(),
      lastRefreshDate: DateTime.now(),
      totalSavings: 0,
      totalExpenses: 0,
      totalIncome: 0,
      week: Week(
        balanceForTheWeek: 0,
        incomeForTheWeek: 0,
        outcomeForTheWeek: 0,
      ),
    );
    users.doc(uid).set(newUser.toJson());
    setCategory();
    return newUser;
  }

  Future setCategory() async {
    CategoryDataModel temp =
        CategoryDataModel(transport: 0, food: 0, miscellaneous: 0, luxury: 0);
    await category.doc(uid).set(temp.toJson());
  }

  Future updateUserInformation({required UserModel updatedUserInfo}) async {
    await getUid();
    print('me called');
    await users.doc(uid).set(updatedUserInfo.toJson());
  }

  Future<UserModel> getUserInfo() async {
    await getUid();
    DocumentSnapshot dsnap = await users.doc(uid).get();
    UserModel userInfo;
    print("snapshot data is ${dsnap.data()}");
    if (dsnap.data() != null) {
      userInfo = UserModel.fromJson(dsnap.data() as Map<String, dynamic>);
    } else {
      userInfo = await setNewUserInfo(userName: '');
    }
    return userInfo;
  }

  Future updateWeekInformationUser(
      {required tx.Transaction newTransactionForWeek, required bool readingMsg}) async {
    UserModel userInfo = await getUserInfo();
    if (newTransactionForWeek.isExpense == true) {
      userInfo.week.outcomeForTheWeek += newTransactionForWeek.amount;
    } else {
      userInfo.week.incomeForTheWeek += newTransactionForWeek.amount;
    }
    if(readingMsg){
      userInfo.messagesReadingDate = DateTime.now();
    }
    updateUserInformation(updatedUserInfo: userInfo);
  }

  //Transactions
  //getting all transactions
  Future<List<tx.Transaction>> getAllTransactions() async {
    await getUid();
    final userTransactionsCollection =
        await transactions.doc(uid).collection('userTransactions').get();

    List<tx.Transaction> txList = [];
    userTransactionsCollection.docs.forEach((element) {
      print(element.data());
      txList.add(tx.Transaction.fromJson(element.data()));
    });
    txList.sort(
      (a, b) {
        return b.transactionTime.compareTo(a.transactionTime);
      },
    );
    print(txList);
    return txList;
  }

  // Add transactions
  Future addTx({required tx.Transaction tx, bool readingMsg = false}) async {
    await getData();
    await userTransactions.set({
      'title': tx.title,
      'description': tx.description,
      'amount': tx.amount,
      'id': tx.id,
      'transactionTime': tx.transactionTime,
      'category': tx.category.toString().split('.')[1],
      'isExpense': tx.isExpense,
    });
    if (tx.isExpense == true) {
      updateCategory(newTransactionCategory: tx);
    }
    updateWeekInformationUser(newTransactionForWeek: tx, readingMsg: readingMsg);
  }

  //Catgeory
  Future getCategoryData() async {
    await getUid();
    categoryData = await category.doc(uid).get();
    if (categoryData.exists) {
      print("Category data is ${categoryData.data()}");
      return CategoryDataModel.fromJson(
          categoryData.data() as Map<String, dynamic>);
    }
  }

  TransactionCategory getCategory(String category) {
    if (category == 'TransactionCategory.food') return TransactionCategory.food;
    if (category == 'TransactionCategory.transport')
      return TransactionCategory.transport;
    else
      return TransactionCategory.miscellaneous;
  }

  Future updateCategory(
      {required tx.Transaction newTransactionCategory}) async {
    await getCategoryData();
    Map<String, dynamic> data = categoryData.data() as Map<String, dynamic>;
    data[newTransactionCategory.category.toString().split('.')[1]] =
        (data[newTransactionCategory.category.toString().split('.')[1]] ?? 0) +
            newTransactionCategory.amount;
    category.doc(uid).set(data);
  }

  Future addGoal({required Goal goal}) async {
    await getData();
    print('dbService wala addGoal');
    // await userGoals.set(goal.toJson());
    try {
      await userGoals.set({
        'title': goal.title,
        'totalAmount': goal.totalAmount,
        'currentAmount': goal.currentAmount,
        'id': goal.id,
      });
    } catch (e) {
      print(e);
    }
    print('goal added successfully : ${goal.toJson()}');
  }

  Future<List<Goal>> getAllGoals() async {
    await getUid();
    final userGoalsCollection =
        await goals.doc(uid).collection('userGoals').get();
    List<Goal> goalsList = [];
    userGoalsCollection.docs.forEach(
      (element) {
        goalsList.add(Goal.fromJson(element.data()));
      },
    );

    return goalsList;
  }
}
