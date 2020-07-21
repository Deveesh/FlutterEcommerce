import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:ecommerce/CategoriesList.dart';
import 'package:ecommerce/RecommendedProducts.dart';
import 'package:ecommerce/Cart.dart';

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
    Widget imageCarousel = new Container(
      height: 200,
    child: new Carousel(
      images: [
        AssetImage('images/w3.jpeg'),
        AssetImage('images/m1.jpeg'),
        AssetImage('images/c1.jpg'),
        AssetImage('images/w4.jpeg'),
        AssetImage('images/m2.jpg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Nymtra"),
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: (){}),
          new IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white), 
              onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Cart()));
              })
        ],
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(accountName: Text("Deveesh"),
                accountEmail: Text("dev97@gmail.com"),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.grey,
            ),
              decoration: BoxDecoration(
                color: Colors.red
              ),
            ),
            InkWell(
              onTap: (){},
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
          Expanded(
              flex: 2,
              child: imageCarousel),

          Expanded(
              flex:1,
              child: CategoriesList()),
          //padding widget
          Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Recent products')),),

          //grid view
          Expanded(
              flex: 2,
              child: Products()),
        ],
      ),
    );
  }
}
