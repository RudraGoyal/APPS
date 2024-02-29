import 'package:flutter/material.dart';

import '../utilites/custom_bottom_navigation_bar.dart';
import '../utilites/page_setter.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  static const routeName = '/landingPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: BrandColor.landingPageBackgroundColor,
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: PageSetter(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
