import 'package:flutter/cupertino.dart';

//Single product
class SingleProduct with ChangeNotifier {
  final String id;
  final String name;
  final String summary;
  final String description;
  final String imgUrl;
  final double originalPrice;
  final double discountPercentage;

  SingleProduct(this.id, this.name, this.summary, this.description, this.imgUrl,
      this.originalPrice, this.discountPercentage);
}