

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../widgets/user_product.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user_product_screen';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context, listen: false).items;
    return Scaffold(
      appBar: AppBar(
        title: Text('User Product Manager'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productData.length,
            itemBuilder: (_, i) => UserProducts(
              idProduct: productData[i].id,
              title: productData[i].title,
              imageUrl: productData[i].imageUrl,
            )),
      ),
    );
  }
}
