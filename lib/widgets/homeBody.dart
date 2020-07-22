import 'package:flutter/material.dart';

import 'allProducts.dart';
import 'category.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 10,),
        Center(
            child: Text(
              "Categories",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            )),
        SizedBox(height: 10,),
        Category(),
        Center(
            child: Text(
              "Categories",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            )),
        SizedBox(height: 10,),
        AllProducts()
      ],
    );
  }
}
