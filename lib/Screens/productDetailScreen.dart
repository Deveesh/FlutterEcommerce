import 'package:ecommerce/Utils/constants.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/products.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const String routeName = "/product-detail";

  @override
  Widget build(BuildContext context) {
    //Get data to display. We pass 'id' of product to display with the arguments
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedPdt = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPdt.name),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(loadedPdt.imgUrl),
                  ),
                ),
                Text(
                  'Price: ₹${loadedPdt.originalPrice}',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    '${loadedPdt.description}',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
              onPressed: () {
                cart.addItem(
                    productId,
                    loadedPdt.name,
                    (loadedPdt.originalPrice *
                        (100 - loadedPdt.discountPercentage) /
                        100));
              },
              child: Container(
                color: ThemeData().primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(
                      Constants.string_addToCart,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
