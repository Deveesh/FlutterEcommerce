import 'package:flutter/material.dart';
import 'package:ecommerce/Cart.dart';

class ThemeAppBar extends AppBar {
}

class _ThemeAppBarState extends State<ThemeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      title: Text("Nymtra"),
      actions: <Widget>[
        new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {}),
        new IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => new Cart()));
            })
      ],
    );
  }
}
