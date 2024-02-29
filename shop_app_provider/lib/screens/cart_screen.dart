import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart';
import '../widgets/cart_tile.dart';
import '../providers/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItemsList = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Cart'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clearCart();
                    },
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  )
                ]),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                var cartItem = cartItemsList[i];
                return CartTile(
                    cartItem.id,
                    cartItem.title,
                    cart.items.keys.toList()[i],
                    cartItem.price,
                    cartItem.quantity);
              }),
        )
      ]),
    );
  }
}
