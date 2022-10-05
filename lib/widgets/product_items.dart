import 'package:flutter/material.dart';
import 'package:re_state_management_shiop/providers/cart.dart';
import 'package:re_state_management_shiop/screens/product_detail_screens.dart';
import 'package:provider/provider.dart';

import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (context, product, _) => IconButton(
              onPressed: () {
                product.toggleChageFavorite();
              },
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addItem(
                  product.id, product.price, product.title, product.imageUrl);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                action: SnackBarAction(textColor: Colors.white,label: 'Undo', onPressed: () {
                  cart.removeSingleItem(product.id);
                },),
                duration: Duration(seconds: 3),
                  backgroundColor: Colors.green,
                  content: Text(
                'Add to cart',
                textAlign: TextAlign.center,
              ),),);
            },
            icon: Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreens.routerName,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
