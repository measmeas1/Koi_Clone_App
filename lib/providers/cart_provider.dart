// ignore_for_file: prefer_final_fields, unused_field

import 'package:assignment/models/drink_item.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<DrinkItem> _cart = [];

  List<DrinkItem> get cart => _cart;

  void addToCart(DrinkItem item) {
    _cart.add(item);
    notifyListeners();
  }
  
  void removeFromCart(DrinkItem item) {
    _cart.remove(item);
    notifyListeners();
  }

  int get cartCount => _cart.length;
}