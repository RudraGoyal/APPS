import 'package:flutter/material.dart';
import 'package:moneytrail/services/controllers/navbar_controller.dart';
import 'package:moneytrail/utilites/colors.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarController>(builder: (context, controller, child) {
      return Container(
        color: Colors.transparent,
        child: Container(
          height: 50,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 1),
            ],
            color: BrandColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                30,
              ),
              topRight: Radius.circular(
                30,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.changePage(0);
                  },
                  child: Icon(
                    controller.isCurrentPage(0)
                        ? Icons.dashboard
                        : Icons.dashboard_outlined,
                    color: Color(0xff151A50),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                GestureDetector(
                  onTap: () {
                    controller.changePage(1);
                  },
                  child:  Icon(
                    controller.isCurrentPage(1)
                        ? Icons.account_balance_wallet_rounded
                        : Icons.account_balance_wallet_outlined,
                    color: Color(0xff151A50),
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                GestureDetector(
                  onTap: () {
                    controller.changePage(2);
                  },
                  child:  Icon(
                    controller.isCurrentPage(2)
                        ? Icons.account_circle
                        : Icons.account_circle_outlined ,
                    color: Color(0xff151A50),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
