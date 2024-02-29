import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/screens/home/home.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:brew_crew/shared/constants.dart';

class SignIn extends StatefulWidget {
  Function toggleView;
  SignIn({required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0,
              title: Text('Sign in to Brew Crew'),
              actions: [
                RaisedButton.icon(
                  color: Colors.brown[400],
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  elevation: 0,
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 30),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Enter an Email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                    decoration: customDecoration.copyWith(hintText: 'Email'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (val) => val == null || val.length < 6
                        ? 'Enter a valid password'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                    decoration: customDecoration.copyWith(hintText: 'Password'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    color: Colors.pink[400],
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            loading = false;
                            error = 'INVALID CREDENTIALS';
                          });
                        }
                      }
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    error,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
          );
  }
}
