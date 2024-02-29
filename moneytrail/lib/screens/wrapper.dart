import 'package:flutter/material.dart';
import 'package:moneytrail/services/controllers/profile_controller.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './dashboard.dart';
import './welcome_page.dart';
import '../screens/landing_page.dart';

import '../services/controllers/auth.dart';
import '../models/user.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late AuthService controller;
  late ProfileController profileController;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (controller.user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, WelcomePage.routeName, (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(
            context, LandingPage.routeName, (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<AuthService>(context, listen: false);
    profileController = Provider.of<ProfileController>(context, listen: false);
    return Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}
