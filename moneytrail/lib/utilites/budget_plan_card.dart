import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'colors.dart';

class BudgetPlanCard extends StatefulWidget {
  BudgetPlanCard({super.key, required this.amount, required this.title});
  String title;
  double amount;
  @override
  State<BudgetPlanCard> createState() => _BudgetPlanCardState();
}

class _BudgetPlanCardState extends State<BudgetPlanCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 170,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: BrandColors.budgetCardBorder),
          shape: BoxShape.rectangle,
          color: BrandColors.nextbuttonbackground,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Icon(Icons.category),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: BrandColors.nextbuttonbackborder,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Text(
                '₹ ${widget.amount}',
                style: TextStyle(
                    color: BrandColors.nextbuttonbackborder,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ]),
      ),
    );
  }
}
