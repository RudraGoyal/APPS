import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartTile extends StatelessWidget {
  final String id;
  final String title;
  final String productId;
  int quantity;
  final double price;

  CartTile(this.id, this.title, this.productId, this.price, this.quantity);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 35,
        ),
      ),
      onDismissed: (direction) {
        cart.removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.all(15),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: FittedBox(
                  child: Text(
                    '\$$price',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            title: Text(title),
            subtitle: Text('Total: \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
