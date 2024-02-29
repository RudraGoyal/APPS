import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moneytrail/services/repositories/database.dart';

import '../../models/user.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String password;
  late String email;
  final FlutterSecureStorage fss;
  AuthService({required this.fss});

  void setPassword(String pass) {
    password = pass;
    notifyListeners();
  }

  void setEmail(String mail) {
    email = mail;
    notifyListeners();
  }

  //notify about signin signout
  User? get user {
    return _auth.currentUser;
  }

  Future signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("auth user is ${_auth.currentUser}");
      await fss.write(
        key: 'uid',
        value: _auth.currentUser!.uid,
      );
      notifyListeners();
      // return _userFromFirebaseUser(user);
      return;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword() async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await fss.write(
        key: 'uid',
        value: _auth.currentUser!.uid,
      );
      notifyListeners();
      // return _userFromFirebaseUser(user);
      return;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    await _auth.signOut();
    await fss.delete(key: 'uid');
    notifyListeners();
  }
}
