import 'package:ecommerce/widgets/searchbar.dart';
import 'package:flutter/material.dart';
import 'allProducts.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SearchBar(),
        ),
        AllProducts()
      ],
    );
  }
}
