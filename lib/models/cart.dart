import 'package:flutter/material.dart';
import 'cartProduct.dart';

//Cart model class
class Cart with ChangeNotifier {
  // Product Id to CartProduct map
  Map<String, CartProduct> _items = {};

  Map<String, CartProduct> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  //Adds product with given id to cart
  void addItem(String pdtid, String name, double price) {
    if (_items.containsKey(pdtid)) {
      _items.update(
          pdtid,
          (existingCartItem) => CartProduct(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
    } else {
      _items.putIfAbsent(
          pdtid,
          () => CartProduct(
                name: name,
                id: DateTime.now().toString(),
                quantity: 1,
                price: price,
              ));
    }
    notifyListeners();
  }

  //Remove item of given id from cart
  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  // Decrease quantity of item with given id in cart
  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id].quantity > 1) {
      _items.update(
          id,
          (existingCartItem) => CartProduct(
              id: DateTime.now().toString(),
              name: existingCartItem.name,
              quantity: existingCartItem.quantity - 1,
              price: existingCartItem.price));
    }
    notifyListeners();
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
