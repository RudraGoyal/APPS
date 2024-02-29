import 'package:flutter/material.dart';
import 'package:moneytrail/screens/futureForecast.dart';
import 'package:moneytrail/screens/input_purchase.dart';
import 'package:moneytrail/screens/overspending.dart';

import '../utilites/colors.dart';
import '../utilites/dashboard_big_button.dart';

class ToolsScreen extends StatefulWidget {
  static const routeName = '/tools_screen';
  const ToolsScreen({super.key});

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: BrandColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              Container(
                width: 254,
                height: 60,
                decoration: BoxDecoration(
                  color: BrandColors.purple_blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(21),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Icon(
                      color: Color(0xffE2E4F3),
                      size: 40,
                      Icons.arrow_back,
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      'Tools',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffE2E4F3),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Icon(
                size: 40,
                color: BrandColors.purple_blue,
                Icons.circle_notifications_rounded,
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              children: [
                big_button(
                  abovetext: 'Input a hypothetical purchase',
                  belowtext: 'You can spend upto ₹32 this week',
                  onPressed: () {
                    Navigator.pushNamed(context, InputPurchase.routeName);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                big_button(
                  abovetext: 'Future Forecast',
                  belowtext: 'You might run overbudget by Sunday',
                  onPressed: () {
                    Navigator.pushNamed(
                        context, FutureForecastScreen.routeName);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                big_button(
                  abovetext: 'Overspending',
                  belowtext: 'Get back on track wit these tips',
                  onPressed: () {
                    Navigator.pushNamed(
                        context, OverSpendingScreen.routeName);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
