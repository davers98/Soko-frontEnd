import 'package:flutter/material.dart';
import 'package:soko_fe/Screens/home.dart';
import 'package:soko_fe/Modals/product.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    // final productId =
    //     ModalRoute.of(context)?.settings.arguments as String; // is the id!
    // final loadedProduct = Provider.of<Product>(
    //   context,
    //   listen: false,
    // ).findById(productId);
    return MaterialApp(
        title: 'Soko',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.purple,
        ),
        debugShowCheckedModeBanner: false,
        home: ProductItem());
  }
}
