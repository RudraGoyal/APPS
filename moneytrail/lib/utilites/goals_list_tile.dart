import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:moneytrail/utilites/edit_goal_data.dart';

import '../models/goal.dart';
import 'colors.dart';

class GoalsListTile extends StatelessWidget {
  final Goal newGoal;
  GoalsListTile({required this.newGoal});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: BrandColors.backgroundgrey)),
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      // padding: EdgeInsets.symmetric(
      //     horizontal: 5, vertical: 3),
      child: ListTile(
        leading: Icon(
          Icons.flag,
          color: BrandColors.purple_blue,
        ),
        title: Text(
          newGoal.title,
          style: TextStyle(
              color: BrandColors.purple_blue, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
            '\$${newGoal.currentAmount.toString()}/${newGoal.totalAmount.toString()}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              color: BrandColors.purple_blue,
              icon: Icon(
                Icons.edit,
                size: 25,
              ),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return EditGoalData(
                        selectedGoal: newGoal,
                      );
                    });
              },
            ),
            IconButton(
              color: BrandColors.redText,
              icon: Icon(
                Icons.delete,
                size: 25,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
