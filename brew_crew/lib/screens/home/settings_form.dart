import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/services/database.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;
  List<String> sugars = ['0', '1', '2', '3', '4'];
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user!.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;
            return Form(
              key: _formkey,
              child: Column(children: [
                Text(
                  'Update User Data',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: _currentName ?? userData!.name,
                  decoration: customDecoration.copyWith(
                      fillColor: Colors.cyan[50], hintText: 'Name'),
                  validator: (value) =>
                      value == null || value == '' ? 'Please Enter Name' : null,
                  onChanged: (val) => setState(() {
                    _currentName = val;
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField<String>(
                    decoration:
                        customDecoration.copyWith(fillColor: Colors.cyan[50]),
                    value: _currentSugars ?? userData!.sugars,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        child: Text('$sugar sugars'),
                        value: sugar,
                      );
                    }).toList(),
                    onChanged: (val) {
                      _currentSugars = val;
                    }),
                SizedBox(
                  height: 25,
                ),
                // slider
                Slider(
                  value: (_currentStrength ?? userData!.strength).toDouble(),
                  activeColor:
                      Colors.brown[_currentStrength ?? userData!.strength],
                  inactiveColor:
                      Colors.brown[_currentStrength ?? userData!.strength],
                  onChanged: (val) =>
                      setState(() => _currentStrength = val.round()),
                  min: 100,
                  max: 900,
                  divisions: 8,
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      await DatabaseService(uid: user.uid).updateUserData(
                          name: _currentName ?? userData!.name,
                          sugars: _currentSugars ?? userData!.sugars,
                          strength: _currentStrength ?? userData!.strength);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  color: Colors.pink[400],
                )
              ]),
            );
          } else {
            return Loading();
          }
        });
  }
}
