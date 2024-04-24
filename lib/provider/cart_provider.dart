import 'package:flutter/material.dart';

class CartItem {
  final String id; // Use this as the unique identifier
  final String productId; // Assuming productId is unique for each product
  final String title;
  final String price;
  final int qty;

  CartItem({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.qty,
  });
}


class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(
      {required String productId,
      required String title,
      required String price}) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              productId: value.productId,
              title: value.title,
              price: value.price,
              qty: value.qty + 1));
      notifyListeners();
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              productId: productId,
              title: title,
              price: price,
              qty: 1));
      notifyListeners();
    }
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
  double get totalToPay{
    double total = 0.0;
    _items.forEach((key, value) =>total += double.parse(value.price)* value.qty );
    

    return total;
  }
}
