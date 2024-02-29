// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jiffy/jiffy.dart';
import 'package:moneytrail/services/controllers/auth.dart';

import 'package:moneytrail/services/repositories/database.dart';

import '../../models/status_enums.dart';
import '../../models/user_model.dart';

class ProfileController with ChangeNotifier {
  final DatabaseService db;
  final FlutterSecureStorage fss;
  final AuthService authService;
  String? uid;
  ProfileController({
    required this.db,
    required this.fss,
    required this.authService,
  });
  Future _getUserId() async {
    uid = await fss.read(key: 'uid');
  }

  UserModel? userInformation;
  Status userInformationStatus = Status.INITIAL;
  Future createNewUser({required String username}) async {
    userInformationStatus = Status.LOADING;
    try {
      await _getUserId();
      notifyListeners();
      userInformation = await db.setNewUserInfo(
        userName: username,
      );
      userInformationStatus = Status.LOADED;
      notifyListeners();
    } catch (e) {
      userInformationStatus = Status.ERROR;
      notifyListeners();
    }
  }

  Future refreshForTheWeek() async {
    userInformation!.totalExpenses += userInformation!.week.outcomeForTheWeek;
    userInformation!.totalIncome += userInformation!.week.incomeForTheWeek;
    userInformation!.week.incomeForTheWeek = 0;
    userInformation!.week.outcomeForTheWeek = 0;
    userInformation!.lastRefreshDate = DateTime.now();
    try {
      await db.updateUserInformation(updatedUserInfo: userInformation!);
    } catch (e) {
      print("error is $e");
    }
    getUserInfo();
  }

  Future<void> deleteFirstTime() async{
    fss.delete(key: 'firstTime');
  }

  Future<bool> firstTimeLoading() async {
    final check = await fss.read(key: 'firstTime');
    if (check == null) {
      fss.write(key: 'firstTime', value: 'true');
      return true;
    }else{
      return false;
    }
  }

  Future getUserInfo() async {
    userInformationStatus = Status.LOADING;
    notifyListeners();
    print('I ran');
    try {
      userInformation = await db.getUserInfo();
      if (Jiffy(DateTime.now())
              .diff(userInformation!.lastRefreshDate, Units.MONTH) !=
          0) {
        refreshForTheWeek();
      } else {
        userInformationStatus = Status.LOADED;
        notifyListeners();
      }
      print('it was success');
    } catch (e) {
      print(e);
      userInformationStatus = Status.ERROR;
      notifyListeners();
    }
  }
}
