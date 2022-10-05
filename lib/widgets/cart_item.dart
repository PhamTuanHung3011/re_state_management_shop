import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final String idKey;

  CartItemWidget(this.idKey);

  @override
  Widget build(BuildContext context) {
    CartItem cartItem = Provider.of<CartItem>(context, listen: false);
    return Dismissible(
      key: ValueKey(cartItem.id),
      background: Container(
        color: Theme.of(context).primaryColor,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).deleteProduct(idKey);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Image.network(
              '${cartItem.imageUrl}',
              fit: BoxFit.cover,
            ),
          ),
          title: Text('${cartItem.title}'),
          subtitle: Text('quantity: ${cartItem.quantity}'),
          trailing: Text('\$${cartItem.price}'),
        ),
      ),
    );
  }
}
