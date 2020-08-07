import 'package:ecommerce/Utils/constants.dart';
import 'package:ecommerce/models/orders.dart';
import 'package:ecommerce/widgets/cartItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/cart.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "/cart";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool performCheckOut = false;
  Cart cart;

  Widget getMainView() {
    print("MAIN VIEW GET $performCheckOut");
    if (performCheckOut) {
      return
        Center(
          child: CircularProgressIndicator(),
        );
    } else {
      return Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, index) =>
                  CartItem(
                      cart.items.values.toList()[index].id,
                      cart.items.keys.toList()[index],
                      cart.items.values.toList()[index].price,
                      cart.items.values.toList()[index].quantity,
                      cart.items.values.toList()[index].name),
            ),
          ),
          FlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text(Constants.string_checkout)],
            ),
            onPressed: cart.totalAmount <= 0
                ? null
                : () {
              Provider.of<Orders>(context, listen: false)
                  .addOrder(cart.items.values.toList(), cart.totalAmount)
                  .then((value) => {
              setState(() {
              performCheckOut = false;
              cart.clear();
              })
              });
              setState(() {
                performCheckOut = true;
              });
            },
          )
        ],
      );
    }
  }

  FutureBuilder getCheckOutBuilder() {
    Future future;
    if (performCheckOut == true) {
      performCheckOut = false;
      future = Provider.of<Orders>(context, listen: false)
          .addOrder(cart.items.values.toList(), cart.totalAmount);
    } else {
      future = null;
    }

    return FutureBuilder(
      future: future,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print("KUCH DATA SHAYD ${snapshot.data}");
        if (snapshot.data != null) {
          setState(() {
            performCheckOut = false;
            cart.clear();
          });
          return Text("CHECKING OUT");
        } else {
          return Text(Constants.string_checkout);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: getMainView()),
        ],
      ),
    );
  }
}
