import 'package:flutter/material.dart';
import 'colors.dart';

class next_button_2 extends StatelessWidget {
  next_button_2(
      {required this.abovetext,
      required this.belowtext,
      required this.sidetext,
      required this.textcolor,
      required this.bordercolour,
      required this.displayicon,
      required this.onPressed});

  final Color bordercolour;
  final Color textcolor;
  final String abovetext;
  final String belowtext;
  final String sidetext;
  final Function onPressed;
  final IconData displayicon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(
          color: BrandColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: BrandColors.purple_blue),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                left: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  bottomLeft: Radius.circular(34),
                ),
              ),
              child: Icon(
                displayicon,
                // Icon(
                //   IconData(0xe51c, fontFamily: 'MaterialIcons'),
                //   IconData(0xf2ff, fontFamily: 'MaterialIcons')
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      abovetext,
                      style: TextStyle(fontSize: 13, color: textcolor),
                    ),
                    Text(
                      belowtext,
                      style: TextStyle(fontSize: 11, color: textcolor),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              //move to next page ya jo bhi connected hai
              child: Container(
                height: 50,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                  right: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Text(sidetext),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
