import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'cartProduct.dart';
import 'singleOrder.dart';

class Orders with ChangeNotifier {
  /* All orders placed by user in this app session. Currently not persisted locally.
  Only sent to Firebase. */
  List<SingleOrder> _orders = [];

  List<SingleOrder> get orders {
    return [..._orders];
  }

  //Sends order to firebase
  Future<void> addOrder(List<CartProduct> cartProducts, double total) async {
    final url = 'https://flutterecommerce-977e0.firebaseio.com/orders.json';
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(url,
          body: json.encode({
            'id': DateTime.now().toString(),
            'total': total,
            'dateTimeOfOrder': timeStamp.toIso8601String(),
            'products': cartProducts
                .map((cp) => {
                      'id': cp.id,
                      'title': cp.name,
                      'quantity': cp.quantity,
                      'price': cp.price
                    })
                .toList(),
          }));
      _orders.insert(
          0,
          SingleOrder(
              id: json.decode(response.body)['name'],
              amount: total,
              dateTime: timeStamp,
              products: cartProducts));
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
