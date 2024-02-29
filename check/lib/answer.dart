import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function() selectHandler;
  final String answerText;
  TextStyle customStyle;

  Answer(this.answerText, this.selectHandler, this.customStyle);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: RaisedButton(
          child: Text(
            answerText,
            style: customStyle,
          ),
          onPressed: selectHandler,
          color: Colors.green[300],
        ));
  }
}
