import 'package:flutter/cupertino.dart';

import 'cart.dart';

class Order with ChangeNotifier {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  Order(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier{
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }


  void addOrder(List<CartItem> cartProduct, double total) {
    _items.insert(0, Order(
        id: DateTime.now().toString(),
        amount: total, products: cartProduct, dateTime: DateTime.now()));
    notifyListeners();
  }
}
