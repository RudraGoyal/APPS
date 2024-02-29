import 'package:flutter/material.dart';
import 'colors.dart';

class back_button extends StatelessWidget {
  back_button(
      {required this.displaytext,
      required this.textcolor,
      required this.fontsize,
      required this.onPressed});
  final Color textcolor;
  final double fontsize;
  final String displaytext;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Text(
        displaytext,
        style: TextStyle(
          color: textcolor,
          fontSize: fontsize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

      // required this.fillcolour,
      // required this.bordercolour,

  // final Color bordercolour;
  // final Color fillcolour;