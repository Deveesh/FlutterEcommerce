import 'package:flutter/cupertino.dart';

//Single Cart item
class CartProduct {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartProduct(
      {@required this.id,
      @required this.name,
      @required this.quantity,
      @required this.price});
}
