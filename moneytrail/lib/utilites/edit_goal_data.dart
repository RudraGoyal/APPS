import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moneytrail/utilites/colors.dart';

import '../models/goal.dart';
import 'roundedbutton.dart';

class EditGoalData extends StatefulWidget {
  final Goal selectedGoal;

  EditGoalData({required this.selectedGoal});

  @override
  State<EditGoalData> createState() => _EditGoalDataState();
}

class _EditGoalDataState extends State<EditGoalData> {
  @override
  void initState() {
    titleController = TextEditingController(text: widget.selectedGoal.title);
    totalAmountController =
        TextEditingController(text: widget.selectedGoal.totalAmount.toString());
    savedAmountController = TextEditingController(
        text: widget.selectedGoal.currentAmount.toString());
    super.initState();
  }

  late TextEditingController titleController;

  late TextEditingController totalAmountController;

  late TextEditingController savedAmountController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Edit Your Goal',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: BrandColors.dark_blue,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                label: Text(
                  'Title',
                  style: TextStyle(
                    color: BrandColors.purple_blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: totalAmountController,
              decoration: const InputDecoration(
                label: Text(
                  'Target Amount',
                  style: TextStyle(
                    color: BrandColors.purple_blue,
                  ),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: savedAmountController,
              decoration: const InputDecoration(
                label: Text(
                  'Saved Amount',
                  style: TextStyle(
                    color: BrandColors.purple_blue,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RoundedButton(
              fillcolour: BrandColors.dark_blue,
              bordercolour: BrandColors.dark_blue,
              displaytext: 'Update Goal',
              onPressed: () {},
              textcolor: BrandColors.white,
            ),
          ],
        )),
      ),
    );
  }
}
