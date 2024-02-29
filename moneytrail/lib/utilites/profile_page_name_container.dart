import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moneytrail/services/controllers/auth.dart';
import 'package:moneytrail/utilites/colors.dart';
import 'package:provider/provider.dart';

class profile_page_name_container extends StatelessWidget {
  profile_page_name_container({
    required this.name,
  });

  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 141,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 24,
                    color: BrandColors.purple_blue,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/Pen.png',
                scale: 4,
              ),
            ],
          ),
          Consumer<AuthService>(builder: (context, controller, child) {
            return Text(
              controller.user != null ? controller.user!.email! : 'No email',
              style: TextStyle(
                  fontSize: 12,
                  color: Color(0xffA6AEB0),
                  fontWeight: FontWeight.bold),
            );
          }),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
