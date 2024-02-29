// ignore_for_file: prefer_const_constructors

import 'package:expenses/widgets/chart.dart';
import 'package:expenses/widgets/transations_list.dart';
import 'package:flutter/material.dart';
import './widgets/new_transactions.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

bool _showChart = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense Manager',
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? titleInput;
  String? amountInput;

  void _addNewTransaction(String txTitle, double txAmount, DateTime date) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      time: date,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(
        () => _userTransactions.removeWhere((element) => element.id == id));
  }

  final List<Transaction> _userTransactions = [];

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransactions(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final isLandsape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appbar = AppBar(
      title: Text(
        'Personal Expenses',
        style: Theme.of(context).appBarTheme.textTheme!.headline6,
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandsape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Chart'),
                  Switch(
                      value: _showChart,
                      onChanged: (val) => setState(() {
                            _showChart = val;
                          }))
                ],
              ),
            if (!isLandsape)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                //  width: double.infinity,
                child: Chart(_userTransactions),
              ),
            if (!isLandsape)
              TransactionsList(_userTransactions, _deleteTransaction),
            if (isLandsape)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appbar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.68,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      //  width: double.infinity,
                      child: Chart(_userTransactions),
                    )
                  : TransactionsList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
