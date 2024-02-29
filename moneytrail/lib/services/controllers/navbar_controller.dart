import 'package:flutter/material.dart';
import 'package:moneytrail/screens/dashboard.dart';
import 'package:moneytrail/screens/tools_screen.dart';

import '../../screens/profile.dart';

class NavBarController extends ChangeNotifier {


  NavBarController() {
    currentPageIndex = 0;
  }

  late AnimationController animationController;

  List<Widget> pages = [
    Dashboard(),
    ToolsScreen(),
    ProfilePage(),
  ];
  late int currentPageIndex;

  void changePage(int index) {
    currentPageIndex = index;
    // toggleAnimation();
    notifyListeners();
  }

  Widget getCurrentPage() {
    return pages[currentPageIndex];
  }

  bool isCurrentPage(int index) {
    return currentPageIndex == index;
  }
}
