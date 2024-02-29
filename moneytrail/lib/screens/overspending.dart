import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';
import 'package:moneytrail/services/controllers/profile_controller.dart';
import 'package:provider/provider.dart';

import '../utilites/colors.dart';
import '../utilites/nextbutton.dart';
import '../utilites/roundedbutton.dart';

class OverSpendingScreen extends StatefulWidget {
  static const routeName = '/overSpending';

  const OverSpendingScreen({super.key});

  @override
  State<OverSpendingScreen> createState() => _OverSpendingScreenState();
}

class _OverSpendingScreenState extends State<OverSpendingScreen> {
  bool showTips = false;
  TextEditingController budgetController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: BrandColors.backgroundgrey,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: BrandColors.backgroundgrey,
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  GestureDetector(
                    onTap: (() => Navigator.pop(context)),
                    child: Container(
                      width: 254,
                      height: 60,
                      decoration: BoxDecoration(
                        color: BrandColors.purple_blue,
                        borderRadius: BorderRadius.all(
                          Radius.circular(21),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Icon(
                            Icons.arrow_back,
                            color: Color(0xffE2E4F3),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Text(
                            'Future Forecast',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffE2E4F3),
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                      size: 40,
                      color: BrandColors.purple_blue,
                      Icons.circle_notifications_rounded),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Overspending Analysis',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                // height: 50,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                  color: BrandColors.greenContainer,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(23),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Average Spent/Month",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      Provider.of<ProfileController>(context, listen: false)
                          .userInformation!
                          .spentPerMonth
                          .toString(),
                      style: const TextStyle(
                        color: Color(0xff292E69),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                // height: 50,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                  color: BrandColors.greenContainer,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(23),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Reduce Spend By",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: budgetController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                // height: 323,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: BrandColors.greenContainer,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(27),
                    topRight: Radius.circular(27),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 2,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (budgetController.text != "") {
                                    print('object');
                                    setState(() {
                                      if (!showTips) {
                                        showTips = true;
                                      }
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: BrandColors.purple_blue,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 2,
                                        color: BrandColors.purple_blue),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'View Saving Tips',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: BrandColors.greenContainer,
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_forward,
                                          color: BrandColors.white,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
