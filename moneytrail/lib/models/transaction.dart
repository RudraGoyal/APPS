import './transaction_category.dart';

class Transaction {
  final String title;
  final String description; //can be empty
  final TransactionCategory category; //from enum
  final DateTime id; // DateTime.now() time of entry
  final DateTime transactionTime; // from datepicker
  final double amount; // >=$0.0
  final bool? isExpense;

  Transaction({
    required this.category,
    required this.id,
    required this.amount,
    required this.description,
    required this.title,
    required this.transactionTime,
    this.isExpense = true,
  });
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      category: getTransactionCategory(json['category']),
      id: json['id'].toDate(),
      amount: json['amount'],
      description: json['description'],
      title: json['title'],
      transactionTime: json['transactionTime'].toDate(),
      isExpense: json['isExpense'] ?? true,
    );
  }
//     return tx.Transaction(
  //       amount: e['amount'],
  //       description: e['description'],
  //       id: (e['id'] as Timestamp).toDate(),
  //       title: e['title'],
  //       transactionTime: (e['transactionTime'] as Timestamp).toDate(),
  //       category: getCategory(e['category']),
  //       isExpense: e['isExpense'],
  //     );
}
