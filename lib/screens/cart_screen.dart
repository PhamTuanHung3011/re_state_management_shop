import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_state_management_shiop/providers/cart.dart';
import 'package:re_state_management_shiop/screens/order_screen.dart';
import 'package:re_state_management_shiop/widgets/cart_item.dart';

import '../providers/order_provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print('order');
              Provider.of<Orders>(context, listen: false).addOrder(
                  cart.items.values.toList(), cart.totalAmount);
              Navigator.pushNamed(
                  context, OrderScreen.routeName, arguments: cart);
              cart.clean();
            },
            child: Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'total',
                      style: TextStyle(fontSize: 20),
                    ),
                    Spacer(),
                    Chip(
                      label: Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('ORDER NOW'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemsCount,
              itemBuilder: (ctx, i) =>
                  ChangeNotifierProvider.value(
                    value: cart.items.values.toList()[i],
                    child: CartItemWidget(cart.items.keys.toList()[i]),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
