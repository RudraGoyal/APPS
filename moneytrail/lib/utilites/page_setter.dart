import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/controllers/navbar_controller.dart';

class PageSetter extends StatelessWidget {
  PageSetter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarController>(
      builder: (context, provider, child) {
        return provider.pages[provider.currentPageIndex];
      },
    );
  }
}