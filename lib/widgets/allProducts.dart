import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/singleProduct.dart';
import 'package:ecommerce/widgets/productItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/models/searchQuery.dart';

//Displays products to buy
class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
//Get models to display data
  String _searchQuery = "";

  //TODO: Complete search bar functionality
  Widget getProductItem(
      int index, String searchQuery, List<SingleProduct> products) {
    if (!products[index]
        .name
        .contains(searchQuery == null ? "" : searchQuery.trim())) {
      return null;
    }

    return ProductItem(
      name: products[index].name,
      imageUrl: products[index].imgUrl,
    );
  }

  Widget makeConsumer() {
    return Consumer<SearchQuery>(builder: (queryContext, searchQuery, child) {
      if (searchQuery == null) {
        print("null H");
      } else {
        print("SSSDAD");
        setState(() {
          _searchQuery = searchQuery.textquery;
        });
        print(searchQuery.textquery);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;

    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: getProductItem(index, _searchQuery, products)),
    );
  }
}
