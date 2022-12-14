import 'package:flutter/material.dart';

class CartItem with ChangeNotifier {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartItem({required this.id,
    required this.title,
    required this.quantity,
    required this.price, required this.imageUrl});

  double total() {
    return quantity * price;
  }
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }


  double get totalAmount {
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
              (existProduct) =>
              CartItem(
                  id: existProduct.id,
                  title: existProduct.title,
                  quantity: existProduct.quantity + 1,
                  price: existProduct.price,
                  imageUrl: existProduct.imageUrl));
    } else {
      _items.putIfAbsent(
          productId,
              () =>
              CartItem(
                  id: DateTime.now().toString(),
                  title: title,
                  quantity: 1,
                  price: price,
                  imageUrl: image));
    }
    notifyListeners();
  }


  void deleteProduct(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]!.quantity > 1) {
      _items.update(productId, (existingCartItem) =>
          CartItem(id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price,
              imageUrl: existingCartItem.imageUrl));
    }
    else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clean() {
    _items = {};
    notifyListeners();
  }

}
