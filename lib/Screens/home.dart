import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soko_fe/Screens/product_card.dart';
import 'package:soko_fe/Services/services.dart';
import 'package:soko_fe/Modals/products.dart';
import 'package:soko_fe/Screens/details.dart';
import 'package:provider/provider.dart';
import 'package:soko_fe/main.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();
  final String title = "Soko";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final ProductCard productCard = ProductCard();

  StreamController<int> streamController = new StreamController<int>();

  gridview(AsyncSnapshot<List<Products>> snapshot) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: snapshot.data!.map(
          (products) {
            return GestureDetector(
              child: GridTile(
                child: ProductCell(products, context),
              ),
              onTap: () {
                goToDetailsPage(context, products);
              },
            );
          },
        ).toList(),
      ),
    );
  }

  goToDetailsPage(BuildContext context, Products products) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => GridDetails(
          curProduct: products,
        ),
      ),
    );
  }

  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: StreamBuilder(
        initialData: 0,
        stream: streamController.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Text('${widget.title} ${snapshot.data}');
        },
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[],
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}

//  final String title = "Products";
//
//  @override
//  Widget build(BuildContext context)
//  {
//    return Scaffold(
//      appBar: AppBar(
//        title: const Text('Soko'),
//
//      ),
//      body: productCard.build(),
//      bottomNavigationBar: BottomNavigationBar(
//          items: const <BottomNavigationBarItem>[
//            BottomNavigationBarItem(
//                icon: Icon(Icons.home),
//                label: 'home'
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.search),
//                label: 'Search'
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(Icons.list),
//                label: 'Notofications'
//            )
//          ]
//      ),
//
//
//    );

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Products>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.productname,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              MyApp.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
