import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:moneytrail/screens/futureForecast.dart';
import 'package:moneytrail/screens/overspending.dart';
import 'package:moneytrail/services/controllers/goals_controller.dart';
import 'package:moneytrail/services/controllers/profile_controller.dart';
import 'package:moneytrail/services/controllers/transactions_controller.dart';
import 'package:moneytrail/services/repositories/database.dart';
import 'package:moneytrail/utilites/add_new_transaction.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:sms/sms.dart';
// import 'package:telephony/telephony.dart';
import './screens/landing_page.dart';
import './screens/wrapper.dart';
import 'services/controllers/auth.dart';
import 'services/controllers/navbar_controller.dart';
import './screens/budget.dart';
import './screens/budget_goals.dart';
import './screens/input_purchase.dart';
import './screens/tools_screen.dart';
import './screens/authentication/login.dart';
import './screens/profile.dart';
import './screens/authentication/signup.dart';
import './screens/dashboard.dart';
import './screens/welcome_page.dart';

onBackgroundMessage(SmsMessage message) async {
  if (message.body != null) {
    if (message.body!.contains('Rs.')) {
      final int index = message.body!.indexOf('Rs. ') + 4;
      final int closingIndex = message.body!.indexOf('.00') + 3;
      if(closingIndex==-1 || index == -1){
        return;
      }
      debugPrint('index is $index and closing is $closingIndex and msg length is ${message.body!.length}');
      final double amount =
          double.parse(message.body!.substring(index, closingIndex));
      print('check 123');
      if (FirebaseAuth.instance.currentUser != null) {
        print('check 1234');
        final fss = const FlutterSecureStorage();
        final uid = await fss.read(key: 'uid');
        FirebaseFirestore.instance
            .collection('transactions')
            .doc(uid)
            .collection('userTransactions')
            .doc()
            .set({
          'title': 'Spending',
          'description': '',
          'amount': amount,
          'id': DateTime.now(),
          'transactionTime': DateTime.now(),
          'category': 'miscellaneous',
          'isExpense': true,
        });
      }
    }
  }
  debugPrint("onBackgroundMessage called");
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SmsReceiver receiver = new SmsReceiver();
  // receiver.onSmsReceived.listen((SmsMessage msg) => print(msg.body));

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final telephony = Telephony.instance;
  // String _message = "";
  // final SmsQuery _query = SmsQuery();
  // List<SmsMessage> _messages = [];

  //declaring all variables
  late final FlutterSecureStorage fss;
  late final DatabaseService dbServ;
  late final AuthService authService;
  late final NavBarController navBarController;
  late final TransactionController transactionController;
  late final ProfileController profileController;
  late final GoalsController goalsController;

  @override
  void initState() {
    //initialising all variables
    fss = FlutterSecureStorage();
    navBarController = NavBarController();
    dbServ = DatabaseService(fss: fss);
    authService = AuthService(
      fss: fss,
    );
    transactionController = TransactionController(
      dbService: dbServ,
    );
    profileController = ProfileController(
      db: dbServ,
      fss: fss,
      authService: authService,
    );
    goalsController = GoalsController(
      dbService: dbServ,
    );
    // initPlatformState();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthService>.value(value: authService),
              ChangeNotifierProvider<ProfileController>.value(
                  value: profileController)
            ],
            child: Wrapper(),
          );
        },
        LandingPage.routeName: (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthService>.value(value: authService),
              ChangeNotifierProvider<TransactionController>.value(
                  value: transactionController),
              ChangeNotifierProvider<NavBarController>.value(
                  value: navBarController),
              ChangeNotifierProvider<ProfileController>.value(
                  value: profileController),
            ],
            child: LandingPage(),
          );
        },
        WelcomePage.routeName: (context) => WelcomePage(),
        LoginPage.routeName: (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthService>.value(value: authService),
              ChangeNotifierProvider<ProfileController>.value(
                  value: profileController),
            ],
            child: LoginPage(),
          );
        },
        SignUpPage.routeName: (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthService>.value(value: authService),
              ChangeNotifierProvider<ProfileController>.value(
                  value: profileController)
            ],
            child: SignUpPage(),
          );
        },
        BudgetPage.routeName: (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthService>.value(value: authService),
              ChangeNotifierProvider<ProfileController>.value(
                  value: profileController),
              ChangeNotifierProvider<TransactionController>.value(
                  value: transactionController),
              ChangeNotifierProvider<GoalsController>.value(
                  value: goalsController),
            ],
            child: BudgetPage(),
          );
        },
        BudgetGoals.routeName: (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthService>.value(value: authService),
              ChangeNotifierProvider<GoalsController>.value(
                  value: goalsController),
            ],
            child: BudgetGoals(),
          );
        },
        ProfilePage.routeName: (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ProfileController>.value(
                  value: profileController),
            ],
            child: ProfilePage(),
          );
        },
        InputPurchase.routeName: (context) => const InputPurchase(),
        FutureForecastScreen.routeName: (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ProfileController>.value(
                  value: profileController),
            ],
            child: FutureForecastScreen(),
          );
        },
        OverSpendingScreen.routeName: (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ProfileController>.value(
                  value: profileController),
            ],
            child: const OverSpendingScreen(),
          );
        },
        ToolsScreen.routeName: (context) => const ToolsScreen(),
      },
      // initialRoute: '/dashboard2',
    );
  }
}
