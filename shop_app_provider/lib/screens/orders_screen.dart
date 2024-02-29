import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/widgets/app_drawer.dart';

import '../providers/orders.dart';
import '../widgets/order_tile.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders_screen';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Your Orders'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartData.orders.length,
        itemBuilder: ((context, i) => OrderTile(cartData.orders[i])),
      ),
      drawer: AppDrawer(),
    );
  }
}
