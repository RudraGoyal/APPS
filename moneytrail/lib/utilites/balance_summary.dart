import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moneytrail/services/controllers/profile_controller.dart';
import 'package:moneytrail/utilites/colors.dart';
import 'package:provider/provider.dart';

import '../models/status_enums.dart';
import '../screens/Budget.dart';
import '../services/controllers/auth.dart';
import '../services/controllers/transactions_controller.dart';
import 'add_new_transaction.dart';

class BalanceSummary extends StatefulWidget {
  const BalanceSummary({super.key});

  @override
  State<BalanceSummary> createState() => _BalanceSummaryState();
}

class _BalanceSummaryState extends State<BalanceSummary> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<ProfileController>(context, listen: false).getUserInfo();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.maxFinite,
      child: Consumer<ProfileController>(
          builder: (context, profileController, child) {
        if (profileController.userInformationStatus != Status.LOADED) {
          return Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            width: double.maxFinite,
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            decoration: BoxDecoration(
              color: BrandColors.dark_blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
          );
        }
        return Stack(
          // alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              width: double.maxFinite,
              margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              decoration: BoxDecoration(
                color: BrandColors.dark_blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Balance for the Month',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    profileController.userInformation!.week.balanceForTheWeek <
                            0
                        ? "₹ (${(profileController.userInformation!.week.balanceForTheWeek * -1).toString()})"
                        : "₹ ${profileController.userInformation!.week.balanceForTheWeek.toString()}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: BrandColors.nextbuttonbackborder,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Outcome',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                                Text(
                                  "₹ ${profileController.userInformation!.week.outcomeForTheWeek.toString()}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: BrandColors.nextbuttonbackborder,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Income',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Text(
                                "₹ ${profileController.userInformation!.week.incomeForTheWeek.toString()}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: BrandColors.nextbuttonbackborder,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            'Saving/Month',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 0,
                          ),
                          Text(
                            "₹ ${profileController.userInformation!.savingsPerMonth.toString()}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 0),
                        ]),
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              // bottom: 170,
              // left: 326,
              right: 5,
              child: GestureDetector(
                onTap: (() {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      constraints: BoxConstraints.expand(),
                      useRootNavigator: true,
                      context: context,
                      builder: (_) {
                        var auth =
                            Provider.of<AuthService>(context, listen: false);
                        return GestureDetector(
                          onTap: () {},
                          // behavior: HitTestBehavior.opaque,
                          child: ChangeNotifierProvider<AuthService>.value(
                            value: auth,
                            child: NewTransaction(
                              transactionController:
                                  Provider.of<TransactionController>(context,
                                      listen: false),
                            ),
                          ),
                        );
                      }).whenComplete(() {
                    print("I run");
                    Provider.of<ProfileController>(context, listen: false)
                        .getUserInfo();
                  });
                }),
                child: Container(
                  alignment: Alignment.center,
                  height: 70,
                  // width: 60,
                  decoration: const BoxDecoration(
                    // borderRadius: BorderRadius.circular(60),
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add_sharp,
                      color: Colors.white,
                      size: 65,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
