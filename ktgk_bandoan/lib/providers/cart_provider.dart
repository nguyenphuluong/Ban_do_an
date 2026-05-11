import 'package:flutter/material.dart';

import '../models/cart_item.dart';
import '../models/food.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addToCart(Food food) {
    final index = _cartItems.indexWhere(
          (item) => item.food.id == food.id,
    );

    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      _cartItems.add(
        CartItem(food: food),
      );
    }

    notifyListeners();
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
    notifyListeners();
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _cartItems.remove(item);
    }

    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0;

    for (var item in _cartItems) {
      total += item.totalPrice;
    }

    return total;
  }

  int get totalItems {
    int total = 0;

    for (var item in _cartItems) {
      total += item.quantity;
    }

    return total;
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}