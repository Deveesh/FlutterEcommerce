import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/widgets/productItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/products.dart';
import 'package:ecommerce/models/searchQuery.dart';

//Displays products to buy
class AllProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get models to display data
    final products = Provider.of<Products>(context).items;
    final searchQuery = Provider.of<SearchQuery>(context);

    //TODO: Complete search bar functionality
    Widget getProductItem(int index) {
      if (!products[index].name.contains(
          searchQuery.textquery == null ? "" : searchQuery.textquery.trim())) {
        return null;
      }

      return ChangeNotifierProvider.value(
          value: products[index],
          child: ChangeNotifierProvider.value(
            value: searchQuery,
            child: ProductItem(
              name: products[index].name,
              imageUrl: products[index].imgUrl,
            ),
          ));
    }

    return GridView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: ChangeNotifierProvider.value(
            value: searchQuery,
            child: ProductItem(
              name: products[index].name,
              imageUrl: products[index].imgUrl,
            ),
          )),
    );
  }
}
