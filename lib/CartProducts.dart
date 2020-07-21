import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsInCart = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "size" : "M",
      "color": "Red",
      "price": 85,
      "quantity": 1
    },
    {
      "name": "Dress",
      "picture": "images/products/dress1.jpeg",
      "size" : "M",
      "color": "Red",
      "price": 50,
      "quantity": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: productsInCart.length,
    itemBuilder: (context, index) {
      return Single_Cart_prod(name: productsInCart[index]["name"],
        color: productsInCart[index]["color"],
      imagePath: productsInCart[index]["picture"],
      size: productsInCart[index]["size"],
      price: productsInCart[index]["price"],
      quantity: productsInCart[index]["quantity"],);
    },);
  }
}

class Single_Cart_prod extends StatelessWidget {
  final name, imagePath, color, quantity, size, price;

  Single_Cart_prod({
    this.name,
    this.imagePath,
    this.color,
    this.quantity,
    this.size,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
      return Card(
        child: ListTile(
          leading: Image.asset(imagePath, height: 80, width: 80,),
          title: Text(name),

          subtitle: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Size: "),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text("$size"),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Color: "),
                  ),
                  Padding(
                    padding: EdgeInsets.all(4),
                    child: Text("$color"),
                  )
                ],
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(4, 4, 4, 12),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("\$${price}", style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
                ),
              )
            ],
          ),

          trailing: Column(
            children: <Widget>[
              Expanded(flex: 2,
                  child: Icon(Icons.arrow_drop_up)),
              Expanded(flex: 1,
                  child: Text("$quantity")),
              Expanded(flex: 2,
                  child: Icon(Icons.arrow_drop_down))
            ],
          ),
        ),
      );
  }

}