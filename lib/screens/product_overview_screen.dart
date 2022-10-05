import 'package:flutter/material.dart';
import 'package:re_state_management_shiop/providers/cart.dart';
import 'package:re_state_management_shiop/providers/product_provider.dart';
import 'package:re_state_management_shiop/widgets/product_gird.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../widgets/badge.dart';
import '../widgets/product_items.dart';
import 'cart_screen.dart';

enum showFavorites {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (showFavorites value) {
                setState(() {
                  if (value == showFavorites.Favorites) {
                    _showFavoriteOnly = true;
                  } else {
                    _showFavoriteOnly = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_horiz_sharp,
              ),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      value: showFavorites.Favorites,
                      child: Text('Favorite Only'),
                    ),
                    PopupMenuItem(
                      value: showFavorites.All,
                      child: Text('All Products'),
                    ),
                  ]),
          Consumer<Cart>(
            builder: (ctx, cartData, ch) => Badge(
              value: cartData.itemsCount.toString(),
              color: Colors.blueAccent,
              child: ch!,
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart_rounded),
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
          )
        ],
      ),
      body: ProductGird(_showFavoriteOnly),
    );
  }
}
