import 'package:flutter/cupertino.dart';
import 'cartProduct.dart';

//Single order
class SingleOrder {
  final String id;
  final double amount;
  final List<CartProduct> products;
  final DateTime dateTime;

  SingleOrder({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}