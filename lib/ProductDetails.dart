import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final name, oldPrice, newPrice, imagePath;

  ProductDetails({this.name, this.oldPrice, this.newPrice, this.imagePath});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              onPressed: () {})
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.imagePath),
              ),
              footer: new Container(
                height: 50,
                color: Colors.white70,
                child: ListTile(
                  leading: Text("${widget.name}", style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("\$${widget.oldPrice}", style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                            fontSize: 18
                        ),),
                      ),

                      Expanded(
                        child: Text("\$${widget.newPrice}", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red
                        ),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                       return AlertDialog(
                         title: Text("TIT"),
                         content: Text("TAT"),
                         actions: <Widget>[
                           MaterialButton(
                             child: Text("Close"),
                             onPressed: (){
                               Navigator.of(context).pop();
                             },
                           )
                         ],
                       );
                    });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Size"),
                      ),

                      Expanded(
                        child: Icon(Icons.arrow_drop_down)
                      )
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Size"),
                      ),

                      Expanded(
                          child: Icon(Icons.arrow_drop_down)
                      )
                    ],
                  ),
                ),
              ),

              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Size"),
                      ),

                      Expanded(
                          child: Icon(Icons.arrow_drop_down)
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  child: Text("Buy Now"),
                  textColor: Colors.white,
                  color: Colors.red,
                ),
              ),

              IconButton(icon: (Icon(Icons.add_shopping_cart, color: Colors.red,)), onPressed: (){}),
              IconButton(icon: (Icon(Icons.favorite_border, color: Colors.red,)), onPressed: (){}),

            ],
          ),
        ListTile(
          title: Text("About:"),
          subtitle: Text("Lorem ipsum dolor sit amet, consectetur "
              "adipiscing elit, sed do eiusmod tempor incididunt ut "
              "labore et dolore magna aliqua. Ut enim ad minim veniam, "
              "quis nostrud exercitation ullamco laboris nisi ut aliquip "
              "ex ea commodo consequat. Duis aute irure dolor in reprehenderit in "
              "voluptate velit esse cillum dolore eu fugiat nulla pariatur."
              " Excepteur sint occaecat cupidatat non proident, sunt in culpa "
              "qui officia deserunt mollit anim id est laborum."),
        ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Name: ", style: TextStyle(color: Colors.grey),),),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Blazer: "),)
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Name: ", style: TextStyle(color: Colors.grey),),),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Blazer: "),)
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Name: ", style: TextStyle(color: Colors.grey),),),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text("Blazer: "),)
            ],
          )
        ],
      )
    );
  }
}
