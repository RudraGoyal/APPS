import 'package:flutter/material.dart';
import 'colors.dart';

class log_out extends StatelessWidget {
  log_out({required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        height: 53,
        decoration: BoxDecoration(
          color: BrandColors.month_year,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'Logout',
            style: TextStyle(
                fontSize: 14, color: Colors.red, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
