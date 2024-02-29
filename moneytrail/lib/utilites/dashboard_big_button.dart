import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:moneytrail/utilites/colors.dart';

class big_button extends StatelessWidget {
  big_button({
    required this.abovetext,
    required this.belowtext,
    required this.onPressed,
  });
  final String abovetext;
  final String belowtext;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff151A50),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: BrandColors.purple_blue),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 117,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(),
                      ),
                      Text(
                        abovetext,
                        style:
                            TextStyle(fontSize: 20, color: BrandColors.white),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(),
                          ),
                          Icon(
                            color: Colors.white,
                            size: 30,
                            Icons.arrow_forward_outlined
                          ),
                        ],
                      ),
                      Text(
                        belowtext,
                        style:
                            TextStyle(fontSize: 14, color: Color(0xffFF4141)),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
