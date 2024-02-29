import 'package:flutter/material.dart';
import 'package:moneytrail/services/controllers/goals_controller.dart';
import 'package:moneytrail/utilites/add_new_goal.dart';
import 'package:moneytrail/utilites/goals_list_tile.dart';
import 'package:provider/provider.dart';

import '../utilites/colors.dart';
import '../utilites/nextbutton.dart';

class BudgetGoals extends StatefulWidget {
  const BudgetGoals({super.key});
  static const routeName = '/budget_goals';

  @override
  State<BudgetGoals> createState() => _BudgetGoalsState();
}

class _BudgetGoalsState extends State<BudgetGoals> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<GoalsController>(context, listen: false).getAllGoals();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final goalsController = Provider.of<GoalsController>(context);
    print('length of goals list = ${goalsController.userGoalsList.length}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BrandColors.purple_blue,
        title: Text('< Goals'),
        leading: Container(),
        elevation: 0,
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        itemCount: goalsController.userGoalsList.length,
        itemBuilder: (BuildContext context, int index) {
          final newGoal = goalsController.userGoalsList[index];
          return GoalsListTile(newGoal: newGoal);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_rounded,
          size: 45,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddNewGoal(goalsController: goalsController),
          );
        },
        backgroundColor: BrandColors.purple_blue,
      ),

      // body: Column(children: [
      //   SizedBox(
      //     height: 10,
      //   ),
      //   Container(
      //     height: 350,
      //     child: Stack(
      //       children: [
      //         Container(
      //           child:
      //         ),
      //         Positioned(
      //           bottom: 0,
      //           right: 0,
      //           left: 0,
      //           child: Consumer<GoalsController>(
      //               builder: (context, goalsController, child) {
      //             return FloatingActionButton(
      //               child: Icon(
      //                 Icons.add_rounded,
      //                 size: 45,
      //               ),
      //               onPressed: () {
      //                 showModalBottomSheet(
      //                   isScrollControlled: true,
      //                   context: context,
      //                   builder: (context) =>
      //                       AddNewGoal(goalsController: goalsController),
      //                 );
      //               },
      //               backgroundColor: BrandColors.purple_blue,
      //             );
      //           }),
      //         ),
      //       ],
      //     ),
      //   ),
      // ]),
    );
  }
}
