import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';
import 'package:moneytrail/services/controllers/profile_controller.dart';
import 'package:provider/provider.dart';

import '../utilites/colors.dart';
import '../utilites/nextbutton.dart';
import '../utilites/roundedbutton.dart';

class FutureForecastScreen extends StatefulWidget {
  static const routeName = '/futureForecast';

  const FutureForecastScreen({super.key});

  @override
  State<FutureForecastScreen> createState() => _FutureForecastScreenState();
}

class _FutureForecastScreenState extends State<FutureForecastScreen> {
  bool showTips = false;
  TextEditingController budgetController = TextEditingController();
  int daysToBudgetRunout = 0;
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
              SizedBox(
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
                      "Showing Forecast For:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      Jiffy().MMMM,
                      style: TextStyle(
                        color: Color(0xff292E69),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
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
                      "Spend Till Date:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      Provider.of<ProfileController>(context, listen: false)
                          .userInformation!
                          .week
                          .outcomeForTheWeek
                          .toString(),
                      style: const TextStyle(
                        color: Color(0xff292E69),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
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
                      "Budget This month",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
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
              SizedBox(
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
                      "Average Expense/Day",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      (Provider.of<ProfileController>(context, listen: false)
                                  .userInformation!
                                  .week
                                  .outcomeForTheWeek /
                              DateTime.now().day)
                          .toStringAsFixed(2),
                      style: const TextStyle(
                        color: Color(0xff292E69),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: showTips,
                child: Container(
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
                        "Days until Budget Runs out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        daysToBudgetRunout.toString(),
                        style: const TextStyle(
                          color: Color(0xff292E69),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
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
                                    double moneyLeft = 0.0;
                                    double moneySpent =
                                        Provider.of<ProfileController>(context,
                                                listen: false)
                                            .userInformation!
                                            .week
                                            .outcomeForTheWeek;
                                    moneyLeft =
                                        double.parse(budgetController.text) -
                                            moneySpent;
                                    double average = double.parse(
                                        (Provider.of<ProfileController>(context,
                                                        listen: false)
                                                    .userInformation!
                                                    .week
                                                    .outcomeForTheWeek /
                                                DateTime.now().day)
                                            .toStringAsFixed(2));
                                    daysToBudgetRunout = (moneyLeft/average).floor();
                                    if(daysToBudgetRunout < 0){
                                      daysToBudgetRunout =0;
                                    }
                                    setState(() {
                                      if(!showTips){
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
                                      children: [
                                        Text(
                                          'Calculate run out time',
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
                              // Visibility(
                              //   visible: showTips,
                              //   child: Text(
                              //     "help",
                              //     // "You might need to cut down ₹$amountToBeSaved for \n$weekDifference week(s)",
                              //     style: TextStyle(
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 17,
                              //     ),
                              //   ),
                              // ),
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
