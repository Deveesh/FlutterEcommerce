import 'package:ecommerce/widgets/categoryCard.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryCard(Icons.book, "Book"),
          CategoryCard(Icons.book, "Book"),
          CategoryCard(Icons.book, "Book"),
          CategoryCard(Icons.book, "Book"),
          CategoryCard(Icons.book, "Book"),
        ],
      ),
    );
  }
}
