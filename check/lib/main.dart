// ignore_for_file: prefer_const_constructors, deprecated_member_usep

import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _index = 0;
  int _totalScore = 0;

  void _answer(int score) {
    setState(() {
      _totalScore += score;
      _index++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _index = 0;
    });
  }

  final _questions = [
    {
      'questionText': 'Question 1',
      'answers': [
        {'text': 'Answer1_1', 'score': 1},
        {'text': 'Answer1_2', 'score': 2},
        {'text': 'Answer1_3', 'score': 3}
      ],
      'style': TextStyle(color: Colors.green),
    },
    {
      'questionText': 'Question 2',
      'answers': [
        {'text': 'Answer2_1', 'score': 1},
        {'text': 'Answer2_2', 'score': 2},
        {'text': 'Answer2_3', 'score': 3}
      ],
      'style': TextStyle(color: Colors.green),
    },
    {
      'questionText': 'Question 3',
      'answers': [
        {'text': 'Answer3_1', 'score': 1},
        {'text': 'Answer3_2', 'score': 2},
        {'text': 'Answer3_3', 'score': 3}
      ],
      'style': TextStyle(color: Colors.green),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text(
            '" QUIZZO "',
            style: TextStyle(
              color: Colors.cyanAccent,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
        ),
        body: _index < 3
            ? Quiz(
                questions: _questions,
                answerQuestion: _answer,
                index: _index,
              )
            : Result(score: _totalScore, resetQuiz: _resetQuiz),
      ),
    );
  }
}
