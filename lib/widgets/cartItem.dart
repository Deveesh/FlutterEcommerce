import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

//Single Cart Item
class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String name;

  CartItem(this.id, this.productId, this.price, this.quantity, this.name);

  @override
  Widget build(BuildContext context) {
    //Get data to display
    final cart = Provider.of<Cart>(context);

    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        cart.removeItem(productId);
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Text("$price"),
            ),
          ),
          title: Text(name),
          subtitle: Text("Total: ${price * quantity}"),
          trailing: Text("$quantity x"),
        ),
      ),
    );
  }
}
