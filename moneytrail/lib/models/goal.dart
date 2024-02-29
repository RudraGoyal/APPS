import 'package:intl/intl.dart';

class Goal {
  final String title;
  final DateTime id;
  final double totalAmount;
  final double currentAmount = 0;

  Goal({required this.id, required this.title, required this.totalAmount});

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
        // currentAmount: json['currentAmount'],
        id: json['id'].toDate(),
        title: json['title'],
        totalAmount: json['totalAmount']);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'totalAmount': totalAmount,
      'currentAmount': currentAmount,
      'id': id,
    };
  }
}
