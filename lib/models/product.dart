import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final String image;
  final double price;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.isFavourite = false,
  });

  void toggleFav(){
    isFavourite = !isFavourite;
    notifyListeners();
  }
}