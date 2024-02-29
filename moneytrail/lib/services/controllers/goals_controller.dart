import 'package:flutter/foundation.dart';
import 'package:moneytrail/services/repositories/database.dart';

import '../../models/goal.dart';

class GoalsController with ChangeNotifier {
  GoalsController({required this.dbService});
  final DatabaseService dbService;
  List<Goal> userGoalsList = [];
  Future getAllGoals() async {
    print('goal controller wala addGoal');
    userGoalsList = await dbService.getAllGoals();
    notifyListeners();
  }

  Future addGoal({required Goal newGoal}) async {
    print('goal controller wala addGoal');
    await dbService.addGoal(goal: newGoal);
    notifyListeners();
  }
}
