import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["cookie classic", "4.00", "assets/p1.jpeg", Colors.green],
    ["cookie choco", "2.50", "assets/p2.jpeg", Colors.yellow],
    ["cookie creem", "12.80", "assets/p3.jpeg", Colors.brown],
    ["cookies classic", "31.00", "assets/p5.jpg", Colors.green],
    ["cookies classic", "15.00", "assets/p6.jpg", Colors.yellow],
    ["cookies classic", "10.00", "assets/p7.jpg", Colors.brown],
    ["cookies classic", "9.00", "assets/p8.jpg", Colors.blue],
    ["cookies classic", "31.00", "assets/p5.jpg", Colors.green],
  ];

  List _cartItems = [];
  get cartItems => _cartItems;
  get shopItems => _shopItems;
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
