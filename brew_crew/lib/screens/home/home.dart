import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              child: SettingsForm(),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            );
          });
    }

    final AuthService _auth = AuthService();
    return StreamProvider<List<Brew>?>.value(
      initialData: null,
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0,
          title: Text('Brew Crew'),
          actions: [
            FlatButton.icon(
                onPressed: (() => _showSettingsPanel()),
                icon: Icon(Icons.edit),
                label: Text('Edit')),
            FlatButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                  print('signed out');
                },
                icon: Icon(Icons.person),
                label: Text('Sign Out'))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
