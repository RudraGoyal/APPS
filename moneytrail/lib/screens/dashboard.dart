import 'package:flutter/material.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moneytrail/models/transaction.dart';
import 'package:moneytrail/models/transaction_category.dart';
import 'package:moneytrail/services/controllers/profile_controller.dart';
import 'package:moneytrail/services/controllers/transactions_controller.dart';
import 'package:permission_handler/permission_handler.dart';
import '../screens/budget.dart';
import 'package:moneytrail/services/controllers/auth.dart';
import 'package:provider/provider.dart';
import '../utilites/balance_summary.dart';
import '../utilites/budget_plan_card.dart';
import '../utilites/colors.dart';
import '../utilites/goals_card.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];
  bool firstTime = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<TransactionController>(context, listen: false)
          .getCatgeoryData();
      await Provider.of<ProfileController>(context, listen: false)
          .getUserInfo();
      print('execute hua bc');

      // print('execute hua bc');
      await initPlatformState(context);
      Provider.of<TransactionController>(context, listen: false)
          .getCatgeoryData();
      await Provider.of<ProfileController>(context, listen: false)
          .getUserInfo();
    });
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<ProfileController>(context, listen: false).deleteFirstTime();
    super.dispose();
  }

  Future<void> initPlatformState(BuildContext context) async {
    var permission = await Permission.sms.status;
    if (permission.isGranted) {
      // Fluttertoast.cancel();
      // Fluttertoast.showToast(msg: 'Me');
      print('object tha yha');
      final messages = await _query.querySms(
        kinds: [SmsQueryKind.inbox],
        sort: true,
        count: 20,
      );
      debugPrint('sms inbox messages: ${messages.length}');
      for (int i = 0; i < messages.length; i++) {
        // Fluttertoast.cancel();
        // Fluttertoast.showToast(msg: messages[i].body ?? 'null' ) ;
        // await Future.delayed(Duration(seconds: 2));
        if (messages[i].body != null && messages[i].date != null) {
        // Fluttertoast.cancel();
        // Fluttertoast.showToast(msg: i.toString());
          await addTransaction(messages[i], context);
        }
      }
    } else {
      await Permission.sms.request();
      if (firstTime) {
        firstTime = !firstTime;
        initPlatformState(context);
      }
    }
  }

  Future<void> addTransaction(SmsMessage message, BuildContext context) async {
    // print('execute hua bc');
    if (Provider.of<ProfileController>(context, listen: false)
            .userInformation!
            .messagesReadingDate
            .compareTo(message.date!) <
        0) {
      // print('execute hua bc');
      if (message.body!.contains('Rs.')) {
        final int index = message.body!.indexOf('Rs. ') + 4;
        final int closingIndex = message.body!.indexOf('.0') + 2;
        if (closingIndex == -1 || index == -1) {
          return;
        }
        final double amount =
            double.parse(message.body!.substring(index, closingIndex));
        print('check 123');
        print('check 1234');
        bool isExpense = true;
        if (message.body!.contains('credit') || message.body!.contains('Cr')) {
          isExpense = false;
        }
        await Provider.of<TransactionController>(context, listen: false)
            .addTransactionMsg(
          newTransaction: Transaction(
            isExpense: isExpense,
            category: TransactionCategory.miscellaneous,
            id: message.date!,
            amount: amount,
            description: '',
            title: message.address ?? 'Automatic' ,
            transactionTime: message.date!,
          ),
        );
      } else if (message.body!.contains('INR')) {
        final int index = message.body!.indexOf('INR') + 4;
        final int closingIndex = message.body!.indexOf('.0') + 2;
        if (closingIndex == -1 || index == -1) {
          return;
        }
        final double amount =
            double.parse(message.body!.substring(index, closingIndex));
        // print('check 123');
        // print('check 1234');
        bool isExpense = true;
        if (message.body!.contains('credit') || message.body!.contains('Cr')) {
          isExpense = false;
        }
        await Provider.of<TransactionController>(context, listen: false)
            .addTransactionMsg(
          newTransaction: Transaction(
            isExpense: isExpense,
            category: TransactionCategory.miscellaneous,
            id: message.date!,
            amount: amount,
            description: '',
            title: 'Automatic',
            transactionTime: message.date!,
          ),
        );
      } else if (message.body!.contains('Rs ')) {
        final int index = message.body!.indexOf('Rs ') + 3;
        final int closingIndex = message.body!.indexOf('.0') + 2;
        if (closingIndex == -1 || index == -1) {
          return;
        }
        final double amount =
            double.parse(message.body!.substring(index, closingIndex));
        print('check 123');
        print('check 1234');
        bool isExpense = true;
        if (message.body!.contains('credit') || message.body!.contains('Cr')) {
          isExpense = false;
        }
        await Provider.of<TransactionController>(context, listen: false)
            .addTransactionMsg(
          newTransaction: Transaction(
            isExpense: isExpense,
            category: TransactionCategory.miscellaneous,
            id: message.date!,
            amount: amount,
            description: '',
            title: 'Automatic',
            transactionTime: message.date!,
          ),
        );
      } else if (message.body!.contains('Rs')) {
        final int index = message.body!.indexOf('Rs') + 2;
        final int closingIndex = message.body!.indexOf('.0') + 2;
        if (closingIndex == -1 || index == -1) {
          return;
        }
        final double amount =
            double.parse(message.body!.substring(index, closingIndex));
        print('check 123');
        print('check 1234');
        bool isExpense = true;
        if (message.body!.contains('credit') || message.body!.contains('Cr')) {
          isExpense = false;
        }
        await Provider.of<TransactionController>(context, listen: false)
            .addTransactionMsg(
          newTransaction: Transaction(
            isExpense: isExpense,
            category: TransactionCategory.miscellaneous,
            id: message.date!,
            amount: amount,
            description: '',
            title: 'Automatic',
            transactionTime: message.date!,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(builder: (context, _authService, child) {
      return Scaffold(
        backgroundColor: BrandColors.backgroundwhite,
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 60,
          backgroundColor: BrandColors.backgroundwhite,
          elevation: 0,
          leadingWidth: 0,
          leading: Container(),
          actions: const [
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Icon(
                Icons.notifications,
                color: BrandColors.dark_blue,
                size: 30,
              ),
            ),
          ],
          title: Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<AuthService>(builder: (context, controller, child) {
                  return Consumer<ProfileController>(
                      builder: (context, controller, child) {
                    if (controller.userInformation == null) {
                      return const Text(
                        'Good Morning ',
                        style: TextStyle(color: BrandColors.greetingText),
                      );
                    } else {
                      return Text(
                        'Good Morning ${controller.userInformation!.userName}',
                        style: TextStyle(color: BrandColors.greetingText),
                      );
                    }
                  });
                }),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyle(color: BrandColors.dark_blue),
                )
              ],
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Provider.of<ProfileController>(context, listen: false)
                .getUserInfo();
            Provider.of<TransactionController>(context, listen: false)
                .getCatgeoryData();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                const BalanceSummary(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Budget Plan',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: BrandColors.dark_blue,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (() =>
                      Navigator.pushNamed(context, BudgetPage.routeName)),
                  child: Container(
                    height: 130,
                    child: Consumer<TransactionController>(
                        builder: (context, transactionController, child) {
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                            transactionController.categoryDataModel == null
                                ? [
                                    // CircularProgressIndicator(),
                                  ]
                                : [
                                    BudgetPlanCard(
                                        amount: transactionController
                                            .categoryDataModel!.food,
                                        title: 'Food'),
                                    BudgetPlanCard(
                                        amount: transactionController
                                            .categoryDataModel!.transport,
                                        title: 'Transport'),
                                    BudgetPlanCard(
                                        amount: transactionController
                                            .categoryDataModel!.miscellaneous,
                                        title: 'Others'),
                                    BudgetPlanCard(
                                        amount: transactionController
                                            .categoryDataModel!.luxury,
                                        title: 'Luxury'),
                                  ],
                      );
                    }),
                  ),
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, BudgetPage.routeName),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    height: 40,
                    width: double.infinity,
                    child: const Text(
                      'Goals',
                      style: TextStyle(
                          color: BrandColors.dark_blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const GoalsCard(),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
