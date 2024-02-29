import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moneytrail/utilites/colors.dart';

import '../models/goal.dart';
import '../services/controllers/goals_controller.dart';
import 'roundedbutton.dart';

class AddNewGoal extends StatefulWidget {
  final GoalsController goalsController;
  const AddNewGoal({super.key, required this.goalsController});

  @override
  State<AddNewGoal> createState() => _AddNewGoalState();
}

class _AddNewGoalState extends State<AddNewGoal> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  Future _addNewGoal() async {
    final enteredTitle = titleController.text;
    if (amountController.text.isEmpty || enteredTitle.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill all  details');
      return;
    }
    final enteredAmount = double.parse(amountController.text);
    if (enteredAmount < 0) {
      Fluttertoast.showToast(msg: 'Amount cannot be negative');
      return;
    }
    final newGoal = Goal(
        id: DateTime.now(), title: enteredTitle, totalAmount: enteredAmount);
    titleController.clear();
    amountController.clear();
    print('idhar aaya');
    await widget.goalsController.addGoal(newGoal: newGoal);
    print('idhar aaya 2');
    print('$newGoal');
    print('idhar aaya 3');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        // height: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Add New Goal!',
              style: TextStyle(
                color: BrandColors.purple_blue,
                fontWeight: FontWeight.w600,
                fontSize: 20,
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
              controller: amountController,
              decoration: const InputDecoration(
                label: Text(
                  'Amount',
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
              displaytext: 'Add Goal',
              onPressed: _addNewGoal,
              textcolor: BrandColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
