import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = 'product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).getProductById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.title),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
