import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jiffy/jiffy.dart';

import '../utilites/colors.dart';
import '../utilites/nextbutton.dart';
import '../utilites/roundedbutton.dart';

class InputPurchase extends StatefulWidget {
  static const routeName = '/input_purchase';

  const InputPurchase({super.key});

  @override
  State<InputPurchase> createState() => _InputPurchaseState();
}

class _InputPurchaseState extends State<InputPurchase> {
  bool showTips = false;
  double amountToBeSaved = 0;
  DateTime selectedDate = DateTime.now();
  num weekDifference = 0;
  TextEditingController costController = TextEditingController();

  @override
  void initState() {
    showTips = false;
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(),
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
                            'Wishlist',
                            style: TextStyle(
                              fontSize: 36,
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
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Text(
                            'Input a hypothetical purchase',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0F0303)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: BrandColors.white,
                            borderRadius: BorderRadius.circular(34),
                            border: Border.all(
                                width: 2, color: BrandColors.purple_blue),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Adidas Shoes'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            'How much does it cost?',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff0F0303)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: BrandColors.white,
                            borderRadius: BorderRadius.circular(34),
                            border: Border.all(
                                width: 2, color: BrandColors.purple_blue),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: TextField(
                              controller: costController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '₹500',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      children: [
                        Text(
                          'When do you wish to purchase it?',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0F0303)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime.utc(2000, 1, 1),
                              lastDate: DateTime.utc(2050, 31, 12),
                              initialDate: DateTime.now(),
                            ).then((value) {
                              setState(() {
                                selectedDate = value ?? selectedDate;
                                // selectedDate = value;
                              });
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            decoration: BoxDecoration(
                              color: BrandColors.white,
                              borderRadius: BorderRadius.circular(34),
                              border: Border.all(
                                  width: 2, color: BrandColors.purple_blue),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                '${selectedDate.day.toString()}/${selectedDate.month.toString()}/${selectedDate.year.toString()}',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                height: 323,
                decoration: BoxDecoration(
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
                                  if (costController.text != '') {
                                    weekDifference = -1 *
                                        Jiffy(DateTime.now()).diff(
                                            Jiffy(selectedDate), Units.WEEK);
                                    print(weekDifference);
                                    if (weekDifference == 0) {
                                      // amountToBeSaved =
                                      amountToBeSaved =
                                          double.parse(costController.text);
                                      weekDifference = 1;
                                      setState(() {
                                        showTips = !showTips;
                                      });
                                    } else if (weekDifference > 0) {
                                      amountToBeSaved =
                                          double.parse(costController.text) /
                                              weekDifference;
                                      setState(() {
                                        showTips = !showTips;
                                      });
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: 'Select a date in future');
                                    }
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Please enter an amount');
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
                                          showTips
                                              ? 'Hide Long Term Tips'
                                              : 'Suggest Long Term Tips',
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
                              Visibility(
                                visible: showTips,
                                child: Text(
                                  "You might need to cut down ₹$amountToBeSaved for \n$weekDifference week(s)",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
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
