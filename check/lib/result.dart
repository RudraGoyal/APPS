import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final score;
  final VoidCallback resetQuiz;

  Result({required this.score, required this.resetQuiz});
  String get resultPhrase {
    String resultText;
    if (score >= 4)
      resultText = 'Well Done';
    else
      resultText = 'Try Again';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.grey,
      child: Column(
        children: [
          Center(
            child: Text(
              '$resultPhrase \nYour final score : $score',
              style: const TextStyle(
                color: Colors.yellow,
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton.icon(
            onPressed: () => resetQuiz,
            icon: Text('Reset Quiz'),
            label: Icon(Icons.restart_alt),
            color: Colors.cyan,
          ),
          TextField(
            textAlign: TextAlign.center,
            textCapitalization: TextCapitalization.words,
          )
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    );
  }
}
