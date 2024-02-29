import 'package:flutter/material.dart';
import 'package:moneytrail/screens/authentication/signup.dart';
import 'package:moneytrail/services/controllers/profile_controller.dart';
import 'package:provider/provider.dart';

import '../../services/controllers/auth.dart';
import '../../utilites/backbutton.dart';
import '../../utilites/emailenter.dart';
import '../../utilites/passwordenter.dart';
import '../../utilites/colors.dart';
import '../../utilites/roundedbutton.dart';
import '../landing_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<AuthService>(context);
    return Scaffold(
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
                      'Log In',
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
                  hinttext: 'Email',
                ),
                const SizedBox(
                  height: 13,
                ),
                PasswordField(hinttext: 'Password'),
                // text_button(hinttext: 'Password'),
                const SizedBox(
                  height: 18,
                ),
                RoundedButton(
                    displaytext: 'Sign In',
                    fillcolour: BrandColors.purple_blue,
                    textcolor: BrandColors.white,
                    bordercolour: BrandColors.purple_blue,
                    onPressed: () async {
                      // _authService.signInWithEmailAndPassword();
                      await _authService.signInWithEmailAndPassword();

                      if (_authService.user != null) {
                        print("yha aaya");
                        await Provider.of<ProfileController>(context,
                                listen: false)
                            .getUserInfo();
                        Navigator.pushReplacementNamed(
                            context, LandingPage.routeName);
                      }
                    }),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have account? ",
                      style: TextStyle(
                        fontSize: 13,
                        color: BrandColors.purple_blue,
                      ),
                    ),
                    back_button(
                      fontsize: 13,
                      displaytext: 'Sign Up',
                      textcolor: BrandColors.purple_blue,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, SignUpPage.routeName);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
