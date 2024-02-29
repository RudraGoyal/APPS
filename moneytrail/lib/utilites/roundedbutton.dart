import 'package:flutter/material.dart';
import 'colors.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.displaytext,
      required this.fillcolour,
      required this.textcolor,
      required this.bordercolour,
      required this.onPressed});

  final Color fillcolour;
  final Color bordercolour;
  final Color textcolor;
  final String displaytext;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        // width: 290,
        height: 44,
        // padding: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(34),
          color: fillcolour,
          border: Border.all(width: 2, color: bordercolour),
        ),
        child: Center(
          child: Text(
            displaytext,
            style: TextStyle(
              color: textcolor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
