import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:moneytrail/models/transaction.dart';
import 'package:moneytrail/utilites/add_new_transaction.dart';

import 'colors.dart';

class TransactionsListTile extends StatelessWidget {
  final Transaction newTransaction;
  const TransactionsListTile({required this.newTransaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: BrandColors.nextbuttonbackground,
      leading: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: BrandColors.greenContainer,
        ),
        child: Text(
          'T',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      title: Text(
        newTransaction.title,
        style: TextStyle(
            color: BrandColors.purple_blue, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        DateFormat.yMEd().format(newTransaction.transactionTime),
      ),
      trailing: (newTransaction.isExpense ?? true)
          ? Text(
              '-₹${newTransaction.amount}',
              style: TextStyle(
                  color: BrandColors.hotPink, fontWeight: FontWeight.w600),
            )
          : Text('+₹${newTransaction.amount}',
              style: TextStyle(color: BrandColors.gandaWalaGreen)),
    );
  }
}
