import 'package:flutter/material.dart';
import 'package:moneytrail/screens/welcome_page.dart';
import 'package:moneytrail/services/controllers/auth.dart';
import 'package:moneytrail/services/controllers/profile_controller.dart';
import 'package:provider/provider.dart';

import '../utilites/custom_bottom_navigation_bar.dart';
import '../utilites/logout_button.dart';
import '../utilites/next_button_profilepage.dart';
import '../utilites/profile_page_name_container.dart';
import '../utilites/colors.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async { 
      await Provider.of<ProfileController>(context, listen: false).getUserInfo();
      print(Provider.of<ProfileController>(context, listen: false).userInformation!.totalExpenses);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: BrandColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(),
          ),
          RefreshIndicator(
            onRefresh: () async {
              Provider.of<ProfileController>(context,listen: false).getUserInfo();
            },
            child: ListView(
              shrinkWrap: true,
              children: [
                Image.asset(
                  'assets/icon.png',
                  scale: 4,
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    // height: 307,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: BrandColors.backgroundwhite,
                    ),
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                      bottom: 40,
                    ),
                    child: Consumer<ProfileController>(
                      builder: (context, profileController, child) {
                        return Column(
                          children: [
                            profile_page_name_container(
                              name: profileController.userInformation!.userName,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: BrandColors.purple_blue,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children:  [
                                  Text(
                                    'Total Savings',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: BrandColors.white,
                                    ),
                                  ),
                                  SizedBox(),
                                  Text(
                                    '₹${profileController.userInformation!.totalSavings.toString()}',
                                    style: TextStyle(
                                        color: BrandColors.white, fontSize: 25),
                                  ),
                                  SizedBox(),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 7),
                                    // width: 132,
                                    // width: double.maxFinite,
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: BrandColors.purple_blue,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:  [
                                          const Text(
                                            'Outcome',
                                            style:
                                                TextStyle(color: BrandColors.white),
                                          ),
                                          Text(
                                            '₹ ${profileController.userInformation!.totalExpenses .toString()}',
                                            style: TextStyle(
                                                color: BrandColors.redText,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17),
                                          ),
                                        ]),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 7,
                                    ),
                                    height: 50,
                                    width: double.infinity,
                                    // width: 132,
                                    decoration: BoxDecoration(
                                      color: BrandColors.purple_blue,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Income',
                                            style:
                                                TextStyle(color: BrandColors.white),
                                          ),
                                          Text(
                                            '₹ ${profileController.userInformation!.totalIncome.toString()}',
                                            style: TextStyle(
                                              color: BrandColors.greenText,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: false,
                              child: Container(
                                margin: EdgeInsets.only(
                                  top: 5,
                                ),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: BrandColors.purple_blue,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            height: 300,
            child: true
                ? ListView(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    children: [
                      const SizedBox(
                        height: 23,
                      ),
                      log_out(onPressed: () async {
                        await Provider.of<AuthService>(context, listen: false)
                            .signOut();
                        // Navigator.pushAndRemoveUntil(context, WelcomePage.routeName, (route) => false);
                        Navigator.pushNamedAndRemoveUntil(
                            context, WelcomePage.routeName, (route) => false);
                      }),
                    ],
                  )
                : ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            child: const Text(
                              'Information',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: BrandColors.purple_blue,
                              ),
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      next_button_3(
                          backgroundcolour: BrandColors.nextbuttonbackground,
                          displayicon: const IconData(0xe57f,
                              fontFamily: 'MaterialIcons'),
                          abovetext: 'Setting',
                          textcolor: Colors.black,
                          bordercolour: Colors.black,
                          onPressed: () {}),
                      const SizedBox(
                        height: 6,
                      ),
                      next_button_3(
                        backgroundcolour: BrandColors.nextbuttonbackground,
                        displayicon:
                            const IconData(0xf0ee, fontFamily: 'MaterialIcons'),
                        abovetext: 'Help Center',
                        textcolor: Colors.black,
                        bordercolour: Colors.black,
                        onPressed: () {},
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      next_button_3(
                        displayicon: const IconData(0xf064c,
                            fontFamily: 'MaterialIcons'),
                        abovetext: 'Term and Condition',
                        textcolor: Colors.black,
                        bordercolour: BrandColors.nextbuttonbackborder,
                        backgroundcolour: BrandColors.nextbuttonbackground,
                        onPressed: () {},
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
