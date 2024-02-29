import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/widgets/app_drawer.dart';

import './cart_screen.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';

enum FilterOptions { ShowAll, ShowFavourites }

class ProductsOverviewScreen extends StatefulWidget {
  static const String routeName = '/productOverviewScreen';
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool showFavs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('MyShop'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions value) {
                setState(() {
                  if (value == FilterOptions.ShowFavourites) {
                    showFavs = true;
                  } else {
                    showFavs = false;
                  }
                });
              },
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('Show All'),
                      value: FilterOptions.ShowAll,
                    ),
                    PopupMenuItem(
                      child: Text('Show Favourites'),
                      value: FilterOptions.ShowFavourites,
                    ),
                  ]),
          Consumer<Cart>(
            builder: ((_, cart, ch) =>
                Badge(value: cart.itemCount.toString(), child: ch)),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                }),
          ),
        ],
      ),
      body: ProductsGrid(showFavs),
      drawer: AppDrawer(),
    );
  }
}
