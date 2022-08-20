import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soko_fe/Services/services.dart';
import 'package:soko_fe/Modals/products.dart';
import 'package:provider/provider.dart';
import 'package:soko_fe/main.dart';
import 'package:soko_fe/Screens/productItem.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();
  final String title = "Soko";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final ProductCard productCard = ProductCard();
  final List<Products> loadedProducts = [
    Products(
      id: 'p1',
      productname: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      image:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Products(
      id: 'p2',
      productname: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Products(
      id: 'p3',
      productname: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      image: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Products(
      id: 'p4',
      productname: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      image:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  final String title = "Products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soko'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: loadedProducts.length,
        itemBuilder: (ctx, i) => ProductItem(
            id: loadedProducts[i].id,
            productname: loadedProducts[i].productname,
            price: loadedProducts[i].price,
            image: loadedProducts[i].image),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
      bottomNavigationBar:
          BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Notofications')
      ]),
    );
  }
}
