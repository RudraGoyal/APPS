import 'package:flutter/material.dart';

import '../utilites/colors.dart';
import '../utilites/nextbutton.dart';

class InputPurchase extends StatefulWidget {
  static const routeName = '/input_purchase';
  const InputPurchase({super.key});

  @override
  State<InputPurchase> createState() => _InputPurchaseState();
}

class _InputPurchaseState extends State<InputPurchase> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: BrandColors.backgroundgrey,
        ),
        child: Scaffold(
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
                  Container(
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
                          color: Color(0xffE2E4F3),
                          IconData(0xe092,
                              fontFamily: 'MaterialIcons',
                              matchTextDirection: true),
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
                  Expanded(
                    child: Container(),
                  ),
                  Icon(
                      size: 40,
                      color: BrandColors.purple_blue,
                      IconData(0xf63f, fontFamily: 'MaterialIcons')),
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
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: '₹500'),
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
                            'When do you wish to purchase it?',
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
                                  hintText: '08/03/23'),
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
                  color: BrandColors.white,
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
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: BrandColors.purple_blue,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 2,
                                        color: BrandColors.purple_blue),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Long Term Tips',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.only(
                                          right: 20,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                'assets/text1.png',
                                scale: 4,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Image.asset(
                                'assets/text2.png',
                                scale: 4,
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
