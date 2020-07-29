import 'package:ecommerce/Utils/constants.dart';
import 'package:ecommerce/models/orders.dart';
import 'package:ecommerce/widgets/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, index) => CartItem(
                  cart.items.values.toList()[index].id,
                  cart.items.keys.toList()[index],
                  cart.items.values.toList()[index].price,
                  cart.items.values.toList()[index].quantity,
                  cart.items.values.toList()[index].name),
            ),
          ),
          CheckoutButton(cart: cart),
        ],
      ),
    );
  }
}

//Places order when clicked
class CheckoutButton extends StatefulWidget {
  //We need cart so we can checkout when this button is clicked
  final Cart cart;
  const CheckoutButton({@required this.cart});

  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(Constants.string_checkout),
      onPressed: widget.cart.totalAmount <= 0
          ? null
          : () async {
              await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(), widget.cart.totalAmount);
              widget.cart.clear();
            },
    );
  }
}
