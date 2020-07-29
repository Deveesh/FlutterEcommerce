import 'package:ecommerce/Screens/cartScreen.dart';
import 'package:ecommerce/Utils/constants.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/orders.dart';
import 'package:ecommerce/models/products.dart';
import 'package:flutter/material.dart';
import 'Screens/homeScreen.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/Screens/productDetailScreen.dart';
import 'models/searchQuery.dart';

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Orders()),
        ChangeNotifierProvider(create: (context) => SearchQuery()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.string_appTitle,
        theme: ThemeData(
            primaryColor: Colors.lightBlue,
            accentColor: Colors.lightBlueAccent),
        home: HomeScreen(),
        routes: {
          ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
          CartScreen.routeName: (context) => CartScreen()
        },
      ),
    );
  }
}
