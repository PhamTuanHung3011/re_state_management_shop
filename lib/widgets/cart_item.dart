import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
class CartItemWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CartItem cartItem = Provider.of<CartItem>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.network('${cartItem.imageUrl}', fit: BoxFit.cover,),
        ),
        title: Text('${cartItem.title}'),
        subtitle: Text('quantity: ${cartItem.quantity}'),
        trailing: Text('\$${cartItem.price}'),
      ),
    );
  }
}
