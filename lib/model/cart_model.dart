import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = [
    // [ itemName, itemPrice, imagePath, color ]
    [
      "Apple watch",
      "200.00",
      "assets/images/watch.jpg",
    ],
    [
      "iphone 15",
      "900",
      "assets/images/i15.jpg",
    ],
    [
      "mack book",
      "1880",
      "assets/images/MACK.jpg",
    ],
    [
      "ipad",
      "1000",
      "assets/images/tablet.jpg",
    ],
  ];

  // list of cart items
  List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
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

  // add item to shop items list
  void addItemToShopItems(List<dynamic> item) {
    _shopItems.add(item);
    notifyListeners();
  }
}
