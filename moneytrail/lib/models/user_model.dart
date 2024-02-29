// UserModel
// - creationDate
// - lastRefreshDate (get this date if this is more than a week then refresh else lite)
// - total savings
// - expenditure till date
// - income till date
// - name
// - saving/month - totalSavings/monthOfCreationDate
// - week
//   - balance for the week
//   - income for the week
//   - outcome for the week

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class UserModel {
  String userName;
  DateTime creationDate;
  DateTime lastRefreshDate;
  DateTime messagesReadingDate;
  double totalSavings;
  double totalExpenses;
  double totalIncome;
  Week week;
  double? savingsPerMonth;
  double? spentPerMonth;

  UserModel({
    required this.userName,
    required this.creationDate,
    required this.lastRefreshDate,
    required this.totalSavings,
    required this.totalExpenses,
    required this.totalIncome,
    required this.week,
    required this.messagesReadingDate,
    this.savingsPerMonth,
    this.spentPerMonth,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    num monthDifference =
        Jiffy(DateTime.now()).diff(json['creationDate'].toDate(), Units.MONTH);
    debugPrint("The month difference is ${json}");
    double totalSavingsCalculated =
        json['totalIncome']+json['week']['incomeForTheWeek'] - json['totalExpenses']-json['week']['outcomeForTheWeek'] + 0.0;
    return UserModel(
      messagesReadingDate: json['messagesReadingDate'].toDate(),
      userName: json['userName'],
      creationDate: json['creationDate'].toDate(),
      lastRefreshDate: json['lastRefreshDate'].toDate(),
      totalSavings: totalSavingsCalculated,
      totalExpenses: monthDifference == 0
          ? json['week']['outcomeForTheWeek']
          : json['totalExpenses'] + 0.0,
      totalIncome: monthDifference == 0
          ? json['week']['incomeForTheWeek']
          : json['totalIncome'] + 0.0,
      week: Week.fromJson(json['week']),
      spentPerMonth: monthDifference == 0
          ? json['totalExpenses']
          : json['totalExpenses'] / monthDifference,
      savingsPerMonth: monthDifference == 0
          ? totalSavingsCalculated
          : (totalSavingsCalculated / monthDifference),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messagesReadingDate'] = messagesReadingDate;
    data['userName'] = userName;
    data['creationDate'] = creationDate;
    data['lastRefreshDate'] = lastRefreshDate;
    data['totalExpenses'] = totalExpenses;
    data['totalIncome'] = totalIncome;
    data['week'] = week.toJson();

    return data;
  }
}

class Week {
  double balanceForTheWeek;
  double incomeForTheWeek;
  double outcomeForTheWeek;

  Week({
    required this.balanceForTheWeek,
    required this.incomeForTheWeek,
    required this.outcomeForTheWeek,
  });

  factory Week.fromJson(Map<String, dynamic> json) {
    return Week(
      balanceForTheWeek: json['incomeForTheWeek'] - json['outcomeForTheWeek'],
      incomeForTheWeek: json['incomeForTheWeek'] + 0.0,
      outcomeForTheWeek: json['outcomeForTheWeek'] + 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['incomeForTheWeek'] = incomeForTheWeek;
    data['outcomeForTheWeek'] = outcomeForTheWeek;
    return data;
  }
}
