import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int index;

  Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[index]['questionText'] as String),
        ...(questions[index]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              answer['text'] as String,
              () => answerQuestion(answer['score']),
              questions[index]['style'] as TextStyle);
        }).toList(),
      ],
    );
  }
}
