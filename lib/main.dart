import 'package:ecommerce/Views/Components/AppBar.dart';
import 'package:ecommerce/Views/Components/ImageCarousek.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'file:///D:/Projects/Flutter/ecommerce/lib/Views/Components/CategoriesList.dart';
import 'package:ecommerce/RecommendedProducts.dart';
import 'package:ecommerce/Cart.dart';
import 'package:ecommerce/Login.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> imagesToShowInCarousel = [
      "images/w3.jpeg",
      "images/m1.jpeg",
      "images/c1.jpeg",
      "images/w4.jpeg",
      "images/m2.jpeg"
    ];

    return Scaffold(
      appBar: ThemeAppBar(),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text("Deveesh"),
              accountEmail: Text("dev97@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              decoration: BoxDecoration(color: Colors.red),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Home"),
                leading: Icon(Icons.home),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(flex: 2, child: ImageCarousel(imagesToShowInCarousel)),

          Expanded(flex: 1, child: CategoriesList()),
          //padding widget
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Recent products')),
          ),

          //grid view
          Expanded(flex: 2, child: Products()),
        ],
      ),
    );
  }
}
