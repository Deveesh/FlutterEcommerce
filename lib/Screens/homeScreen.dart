import 'package:ecommerce/Screens/cartScreen.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:ecommerce/widgets/homeBody.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            Constants.string_appTitle,
            style: TextStyle(color: Colors.white),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            )
          ],
        ),
        body: HomeBody());
  }
}
