import 'package:flutter/material.dart';

import '../utilites/colors.dart';
import '../utilites/roundedbutton.dart';

class WelcomePage extends StatefulWidget {
  static const routeName = '/welcome_page';

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColors.dark_blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Image.asset(
                'assets/icon.png',
                scale: 4,
              ),
              const Text(
                'Your personal finance companion.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: BrandColors.white,
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 300,
          // ),
          Column(
            children: [
              RoundedButton(
                  displaytext: 'Login',
                  fillcolour: BrandColors.purple_blue,
                  textcolor: BrandColors.white,
                  bordercolour: BrandColors.purple_blue,
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  }),
              const SizedBox(
                height: 16,
              ),
              RoundedButton(
                  displaytext: 'Sign Up',
                  fillcolour: BrandColors.dark_blue,
                  textcolor: BrandColors.white,
                  bordercolour: BrandColors.purple_blue,
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
