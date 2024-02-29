import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPct;

  const ChartBar(this.label, this.spendingAmount, this.spendingPct);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Column(
          children: [
            Container(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(
                child: Text(
                  '₹ ${spendingAmount.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontFamily: 'OpenSans',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.04,
            ),
            Container(
              height: constraint.maxHeight * 0.60,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: const Color.fromARGB(255, 185, 184, 184),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPct,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.04,
            ),
            FittedBox(
              child: Container(
                height: constraint.maxHeight * 0.12,
                child: Text(
                  label,
                  style: const TextStyle(fontFamily: 'OpenSans'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
