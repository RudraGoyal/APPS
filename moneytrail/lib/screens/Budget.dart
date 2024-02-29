import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:moneytrail/screens/budget_goals.dart';

import 'package:moneytrail/services/controllers/profile_controller.dart';
import 'package:moneytrail/services/controllers/goals_controller.dart';
import 'package:moneytrail/services/controllers/transactions_controller.dart';
import 'package:moneytrail/utilites/add_new_transaction.dart';
import 'package:moneytrail/utilites/goals_list_tile.dart';
import 'package:moneytrail/utilites/transactions_list_tile.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import '../chart/pie_chart.dart';
import '../services/controllers/auth.dart';
import '../services/repositories/database.dart';
import '../utilites/backbutton.dart';
import '../utilites/nextbutton.dart';
import '../chart/piechart.dart';
import '../utilites/colors.dart';
import '../utilites/customshape.dart';
import '../models/transaction.dart' as tx;

class BudgetPage extends StatefulWidget {
  static const routeName = '/budget';

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  Map<String, double> categoryData = {
    'luxury': 100.0,
    'essentials': 200.0,
    'taxi': 100,
    'food': 100,
    'clothes': 100,
    'others': 100,
  };
  List<tx.Transaction> transactionList = [];
  late TransactionController transactionController;
  @override
  void initState() {
    transactionController =
        Provider.of<TransactionController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      transactionController.getCatgeoryData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<TransactionController>(context, listen: false)
        .getAllTransactions();
    return Container(
      decoration: const BoxDecoration(
        color: BrandColors.white,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: BrandColors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                constraints: BoxConstraints.expand(),
                useRootNavigator: true,
                context: context,
                builder: (_) {
                  var auth = Provider.of<AuthService>(context, listen: false);
                  return GestureDetector(
                    onTap: () {},
                    // behavior: HitTestBehavior.opaque,
                    child: ChangeNotifierProvider<AuthService>.value(
                      value: auth,
                      child: NewTransaction(
                        transactionController:
                            Provider.of<TransactionController>(context,
                                listen: false),
                      ),
                    ),
                  );
                }).whenComplete(() {
              print("I run");
              Provider.of<ProfileController>(context, listen: false)
                  .getUserInfo();
            });
          },
          child: Text(
            '+',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: BrandColors.purple_blue,
            shape: CircleBorder(),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 150,
          backgroundColor: BrandColors.purple_blue,
          leading: Padding(
            padding: const EdgeInsets.only(left: 30),
            child: back_button(
              displaytext: '< Budget',
              fontsize: 20,
              textcolor: BrandColors.month_year,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  ClipPath(
                    clipper: Customshape(),
                    child: Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: BrandColors.purple_blue,
                        // borderRadius: BorderRadius.only(
                        //   bottomRight: Radius.circular(40),
                        // ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${Jiffy(DateTime.now()).MMMM}, ${DateTime.now().year}',
                    style: TextStyle(
                        fontSize: 18,
                        color: BrandColors.month_year,
                        fontWeight: FontWeight.w500),
                  ), //create a fuction to get the date

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 30,
                    ),
                    child: Container(
                      // height: 177,
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(26)),
                        color: BrandColors
                            .backgroundwhite, //change to white later,
                      ),
                      child: Consumer<TransactionController>(
                          builder: (context, transController, child) {
                        if (transController.categoryDataModel == null) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Center(
                          child: PieChart(
                            dataMap:
                                transController.categoryDataModel!.toJson(),
                            baseChartColor: Colors.transparent,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 25,
                            chartRadius: 100,
                            colorList: [
                              BrandColors.purple_blue,
                              Color(0xffF8C7D4),
                              Color(0xffDA3D5D),
                              Color(0xffBBBEE2),
                              Colors.grey.shade400,
                              Colors.blue,
                              Colors.orange,
                              Colors.yellow,
                              Colors.green,
                              Colors.white,
                            ],
                            legendOptions: LegendOptions(),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValues: false,
                              showChartValuesInPercentage: true,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pushNamed(
                              context, BudgetGoals.routeName),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Goals',
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    color: BrandColors.purple_blue,
                                  ),
                                ),
                                const SizedBox(
                                  height: 17,
                                ),
                                Consumer<GoalsController>(
                                  builder: (context, goalsController, child) {
                                    if (goalsController.userGoalsList.isEmpty) {
                                      return Container(
                                        alignment: Alignment.center,
                                        width: double.maxFinite,
                                        child: Text(
                                          'No Goals Yet',
                                          style: TextStyle(fontSize: 30),
                                        ),
                                      );
                                    }
                                    final firstGoal =
                                        goalsController.userGoalsList[0];
                                    // return ListTile(
                                    //   tileColor:
                                    //       BrandColors.nextbuttonbackground,
                                    //   leading: Icon(
                                    //     Icons.flag,
                                    //     color: BrandColors.purple_blue,
                                    //   ),
                                    //   title: Text(
                                    //     firstGoal.title,
                                    //     style: TextStyle(
                                    //         color: BrandColors.purple_blue,
                                    //         fontWeight: FontWeight.w500),
                                    //   ),
                                    //   subtitle: Text(''),
                                    //   trailing: Text(''),
                                    // );
                                    return GoalsListTile(newGoal: firstGoal);
                                  },
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Transaction',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: BrandColors.purple_blue,
                          ),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Consumer<TransactionController>(
                          builder: (context, transactionController, child) {
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: transactionController
                                  .userTransactionList.length,
                              itemBuilder: (context, index) {
                                final newTransaction = transactionController
                                    .userTransactionList[index];
                                // return Container(
                                //   margin: EdgeInsets.symmetric(vertical: 10),
                                //   child: next_button(
                                //     backgroundcolour:
                                //         BrandColors.nextbuttonbackground,
                                //     displayicon: IconData(0xf2ff,
                                //         fontFamily: 'MaterialIcons'),
                                //     abovetext: newTransaction.title,
                                //     belowtext: DateFormat()
                                //         .format(newTransaction.transactionTime),
                                //     textcolor: Colors.black,
                                //     bordercolour: Colors.black,
                                //     onPressed: () {},
                                //   ),
                                // );
                                return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: BrandColors.backgroundgrey)),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 10),
                                  // padding: EdgeInsets.symmetric(
                                  //     horizontal: 5, vertical: 3),
                                  child: TransactionsListTile(
                                    newTransaction: newTransaction,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        // Consumer<TransactionController>(
                        //   builder: (context, transactionController, child) {
                        //     return StreamBuilder(
                        //       stream: transactionController
                        //           .getAllTransactions()
                        //           .asStream(),
                        //       builder: (context, snapshot) {
                        //         final newTransaction = snapshot.data;
                        //         return next_button(
                        //           backgroundcolour:
                        //               BrandColors.nextbuttonbackground,
                        //           displayicon: IconData(0xf2ff,
                        //               fontFamily: 'MaterialIcons'),
                        //           abovetext: ,
                        //           belowtext: 'a',
                        //           textcolor: Colors.black,
                        //           bordercolour: Colors.black,
                        //           onPressed: () {},
                        //         );
                        //       },
                        //     );
                        //   },
                        // ),
                        // next_button(
                        //   backgroundcolour: BrandColors.nextbuttonbackground,
                        //   displayicon:
                        //       IconData(0xf2ff, fontFamily: 'MaterialIcons'),
                        //   abovetext: 'abovetext',
                        //   belowtext: 'a',
                        //   textcolor: Colors.black,
                        //   bordercolour: Colors.black,
                        //   onPressed: () {},
                        // ),
                        // const SizedBox(
                        //   height: 14,
                        // ),
                        // next_button(
                        //   displayicon:
                        //       IconData(0xf2ff, fontFamily: 'MaterialIcons'),
                        //   abovetext: 'abovetext',
                        //   belowtext: 'a',
                        //   textcolor: Colors.black,
                        //   bordercolour: BrandColors.nextbuttonbackborder,
                        //   backgroundcolour: BrandColors.nextbuttonbackground,
                        //   onPressed: () {},
                        // ),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
