import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moneytrail/screens/budget.dart';

import 'colors.dart';

class GoalsCard extends StatefulWidget {
  const GoalsCard({super.key});

  @override
  State<GoalsCard> createState() => _GoalsCardState();
}

class _GoalsCardState extends State<GoalsCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BudgetPage.routeName);
      },
      child: Container(
        height: 90,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: BrandColors.budgetCardBorder),
          shape: BoxShape.rectangle,
          color: BrandColors.nextbuttonbackground,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(Icons.hotel_sharp),
          Column(
            children: [
              Text(
                'Holiday',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: BrandColors.dark_blue,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '₹120/₹200',
                style: TextStyle(color: BrandColors.dark_blue, fontSize: 13),
              )
            ],
          ),
          SizedBox(
            width: 140,
          ),
          Icon(Icons.arrow_forward_ios_rounded)
        ]),
      ),
    );
  }
}
