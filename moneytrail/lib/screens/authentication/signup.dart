import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moneytrail/screens/authentication/login.dart';
import 'package:moneytrail/screens/landing_page.dart';
import 'package:moneytrail/screens/authentication/login.dart';
import 'package:moneytrail/services/controllers/auth.dart';
import 'package:moneytrail/services/controllers/profile_controller.dart';
import 'package:provider/provider.dart';

import '../../utilites/backbutton.dart';
import '../../utilites/emailenter.dart';
import '../../utilites/passwordenter.dart';
import '../../utilites/colors.dart';
import '../../utilites/roundedbutton.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    return Container(
      decoration: const BoxDecoration(
        color: BrandColors.backgroundwhite,
      ),
      child: Scaffold(
        backgroundColor: BrandColors.backgroundwhite,
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 100,
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: back_button(
              displaytext: '<Back',
              fontsize: 20,
              textcolor: BrandColors.black,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // back_button(
            //   displaytext: '<Back',
            //   fontsize: 20,
            //   textcolor: BrandColors.black,
            //   onPressed: () {},
            // ),
            Image.asset(
              'assets/icon.png',
              scale: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: BrandColors.purple_blue,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  text_button(
                    hinttext: 'Email id',
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  PasswordField(hinttext: 'Password'),
                  const SizedBox(
                    height: 13,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: BrandColors.white,
                      borderRadius: BorderRadius.circular(34),
                      border:
                          Border.all(width: 2, color: BrandColors.purple_blue),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextFormField(
                        controller: userNameController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Username'),
                        validator: (val) => val == null || val.isEmpty
                            ? 'Enter a valid Username'
                            : null,
                      ),
                    ),
                  ),
                  // text_button(hinttext: 'Password'),
                  const SizedBox(
                    height: 18,
                  ),

                  RoundedButton(
                      displaytext: 'Sign Up',
                      fillcolour: BrandColors.purple_blue,
                      textcolor: BrandColors.white,
                      bordercolour: BrandColors.purple_blue,
                      onPressed: () async {
                        if (userNameController.text != '') {
                          await _authService.registerWithEmailAndPassword();
                          if (_authService.user != null) {
                            await Provider.of<ProfileController>(context,
                                    listen: false)
                                .createNewUser(
                              username: userNameController.text,
                            );
                            Navigator.pushNamedAndRemoveUntil(context,
                                LandingPage.routeName, (route) => false);
                          }
                        }else{
                          Fluttertoast.showToast(msg: 'Enter all the details');
                        }
                      }),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'have account? ',
                        style: TextStyle(
                          fontSize: 13,
                          color: BrandColors.purple_blue,
                        ),
                      ),
                      back_button(
                        fontsize: 13,
                        displaytext: 'Sign In',
                        textcolor: BrandColors.purple_blue,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, LoginPage.routeName);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
