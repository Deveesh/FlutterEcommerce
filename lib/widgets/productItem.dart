import 'package:ecommerce/Screens/productDetailScreen.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:ecommerce/models/singleProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/cart.dart';

//Single product item
class ProductItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  ProductItem({this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    //Get data to display
    final pdt = Provider.of<SingleProduct>(context);
    final cart = Provider.of<Cart>(context);

    return GestureDetector(
      onTap: () {
        //We pass 'id' of product to display with the arguments
        Navigator.of(context)
            .pushNamed(ProductDetailsScreen.routeName, arguments: pdt.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridTile(
          child: Image.network(imageUrl),
          footer: GridTileBar(
            title: Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  pdt.summary,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "₹${pdt.originalPrice * (100-pdt.discountPercentage) / 100}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "₹${pdt.originalPrice}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${pdt.discountPercentage.toInt()}% off",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: ThemeData().primaryColor,
              ),
              onPressed: () {
                cart.addItem(pdt.id, pdt.name, (pdt.originalPrice * (100-pdt.discountPercentage) / 100));
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(seconds: 2),
                    content: Text(Constants.string_addedToCart),
                  ),
                );
              },
            ),
            backgroundColor: Colors.white70,
          ),
        ),
      ),
    );
  }
}
