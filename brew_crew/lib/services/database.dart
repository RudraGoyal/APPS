import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/models/brew.dart';

class DatabaseService {
  String? uid;

  DatabaseService({String? uid}) {
    this.uid = uid;
  }
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(
      {required String sugars,
      required String name,
      required int strength}) async {
    return await brewCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot? snapshot) {
    return UserData(
        name: snapshot!['name'],
        strength: snapshot['strength'],
        sugars: snapshot['sugars'],
        uid: uid!);
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: doc['name'] ?? '',
        strength: doc['strength'] ?? 0,
        sugars: doc['sugars'] ?? '',
      );
    }).toList();
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
