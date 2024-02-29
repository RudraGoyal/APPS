import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:moneytrail/services/controllers/transactions_controller.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import '../models/transaction_category.dart';
import '../services/repositories/database.dart';
import '../utilites/colors.dart';
import '../utilites/roundedbutton.dart';

import '../services/controllers/auth.dart';

class NewTransaction extends StatefulWidget {
  final TransactionController transactionController;
  const NewTransaction({super.key, required this.transactionController});
  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  TransactionCategory? selectedCategory = null;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  DateTime? selectedDate = DateTime.now();
  bool isExpense = true;

  Future _addNewTransaction() async {
    final enteredTitle = titleController.text;
    final enteredDesc = descriptionController.text;
    if (amountController.text.isEmpty || enteredTitle.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill all  details');
      return;
    }
    final enteredAmount = double.parse(amountController.text);
    if (enteredAmount < 0) {
      Fluttertoast.showToast(msg: 'Amount cannot be negative');
      return;
    }

    final newTx = Transaction(
      category: selectedCategory!,
      id: DateTime.now(),
      amount: enteredAmount,
      description: enteredDesc.isEmpty ? "" : enteredDesc,
      title: enteredTitle,
      transactionTime: selectedDate!,
      isExpense: isExpense,
    );
    titleController.clear();
    descriptionController.clear();
    amountController.clear();
    selectedDate = DateTime.now();
    await widget.transactionController.addTransaction(newTransaction: newTx);
    print('${newTx.title} ${newTx.id} ${newTx.transactionTime}');
    Navigator.pop(context);
  }

  bool enableAddTx() {
    if (titleController.text.isEmpty || amountController.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please fill all details');
      return false;
    } else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Add a New Transaction',
                style: TextStyle(
                    color: BrandColors.purple_blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const SizedBox(
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
                )),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                    label: Text(
                  'Description (optional)',
                  style: TextStyle(
                    color: BrandColors.purple_blue,
                  ),
                )),
              ),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(
                    label: Text(
                  'Amount',
                  style: TextStyle(
                    color: BrandColors.purple_blue,
                  ),
                )),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 15,
              ),
              DropdownButton(
                  value: selectedCategory,
                  hint: const Text(
                    'Select Category',
                    style: TextStyle(
                      color: BrandColors.purple_blue,
                    ),
                  ),
                  items: TransactionCategory.values
                      .map((TransactionCategory category) {
                    return DropdownMenuItem<TransactionCategory>(
                        value: category,
                        child: Text(
                            category.toString().split('.')[1].toUpperCase()));
                  }).toList(),
                  onChanged: ((TransactionCategory? value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  })),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: RadioListTile<bool>(
                        title: Text(
                          'Expense',
                          style: TextStyle(
                            color: BrandColors.purple_blue,
                          ),
                        ),
                        groupValue: true,
                        value: isExpense,
                        onChanged: (bool? value) {
                          setState(() {
                            isExpense = true;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<bool>(
                        title: Text(
                          'Income',
                          style: TextStyle(
                            color: BrandColors.purple_blue,
                          ),
                        ),
                        groupValue: false,
                        value: isExpense,
                        onChanged: (bool? value) {
                          setState(() {
                            isExpense = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  DateFormat.yMMMd().format(selectedDate!),
                  style: const TextStyle(
                      color: BrandColors.purple_blue, fontSize: 15),
                ),
                RoundedButton(
                  fillcolour: Colors.transparent,
                  bordercolour: Colors.transparent,
                  displaytext: 'Choose Date',
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime.utc(2000, 1, 1),
                      lastDate: DateTime.utc(2050, 31, 12),
                      initialDate: DateTime.now(),
                    ).then((value) {
                      setState(() {
                        selectedDate = value;
                      });
                    });
                  },
                  textcolor: BrandColors.purple_blue,
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              RoundedButton(
                fillcolour: BrandColors.dark_blue,
                bordercolour: BrandColors.dark_blue,
                displaytext: 'Add Transaction',
                onPressed: _addNewTransaction,
                textcolor: BrandColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
