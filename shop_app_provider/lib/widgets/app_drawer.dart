import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app_provider/screens/orders_screen.dart';
import 'package:shop_app_provider/screens/products_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text('Hello Friend!'),
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text('Shop'),
          onTap: () {
            Navigator.pushReplacementNamed(
                context, ProductsOverviewScreen.routeName);
          },
        ),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Yours Orders'),
          onTap: () {
            Navigator.pushReplacementNamed(context, OrdersScreen.routeName);
          },
        ),
      ]),
    );
  }
}
