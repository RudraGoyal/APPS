import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/orders.dart';
import './screens/orders_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './screens/cart_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        home: ProductsOverviewScreen(),
        theme: ThemeData(
          primaryColor: Colors.purple,
          accentColor: Colors.orange,
          fontFamily: 'Lato',
        ),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          ProductsOverviewScreen.routeName: (context) =>
              ProductsOverviewScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName:(context) => OrdersScreen(),
        },
      ),
    );
  }
}
