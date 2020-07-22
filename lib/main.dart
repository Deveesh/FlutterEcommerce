import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'Screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Products())],
      child: MaterialApp(
        title: "Flutter Ecommerce App",
        theme: ThemeData(
            primaryColor: Colors.blue, accentColor: Colors.blueGrey),
        home: HomePage(),
      ),
    );
  }
}
