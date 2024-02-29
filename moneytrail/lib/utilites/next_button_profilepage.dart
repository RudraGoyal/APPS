import 'package:flutter/material.dart';
import 'colors.dart';

class next_button_3 extends StatelessWidget {
  next_button_3(
      {required this.abovetext,
      required this.textcolor,
      required this.bordercolour,
      required this.backgroundcolour,
      required this.displayicon,
      required this.onPressed});

  final Color bordercolour;
  final Color backgroundcolour;
  final Color textcolor;
  final String abovetext;
  final Function onPressed;
  final IconData displayicon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: backgroundcolour,
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
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 15,
                  bottom: 15,
                ),
                child: Text(
                  abovetext,
                  style: TextStyle(fontSize: 14, color: textcolor),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              //move to next page ya jo bhi connected hai
              child: Container(
                height: 60,
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
                child: Icon(
                  IconData(0xee8c,
                      fontFamily: 'MaterialIcons', matchTextDirection: true),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
