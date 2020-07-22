import 'package:ecommerce/widgets/allProducts.dart';
import 'package:ecommerce/widgets/category.dart';
import 'package:ecommerce/widgets/homeBody.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          "ECOM",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: HomeBody()
    );
  }
}
