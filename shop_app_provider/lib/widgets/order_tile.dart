import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:shop_app_provider/providers/orders.dart';

class OrderTile extends StatefulWidget {
  final OrderItem order;
  OrderTile(this.order);

  @override
  State<OrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<OrderTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      child: Column(children: [
        ListTile(
          title: Text('\$${widget.order.amount}'),
          subtitle:
              Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.time)),
          trailing: IconButton(
            icon: Icon(_expanded
                ? Icons.expand_less_rounded
                : Icons.expand_more_rounded),
            onPressed: () {
              _expanded = !_expanded;
              setState(() {});
            },
          ),
        ),
        if (_expanded)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: min(widget.order.products.length * 20 + 10, 160),
            child: ListView(
              children: [
                ...widget.order.products.map((prod) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        prod.title,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text('${prod.quantity} x \$${prod.price}'),
                    ],
                  );
                }).toList()
              ],
            ),
          ),
      ]),
    );
  }
}
