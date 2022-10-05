import 'package:flutter/material.dart';

class CartItem with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price, required this.imageUrl});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }
  int get itemsCount {
    return _items.length;
  }



  double get totalAmount{
    double total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(String productId, double price, String title, String image) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existProduct) => CartItem(
              id: existProduct.id,
              title: existProduct.title,
              quantity: existProduct.quantity + 1,
              price: existProduct.price, imageUrl: existProduct.imageUrl));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              quantity: 1,
              price: price, imageUrl: image));
    }
    notifyListeners();
  }

}
