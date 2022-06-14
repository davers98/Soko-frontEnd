import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soko_fe/Screens/product_card.dart';
import 'package:soko_fe/Services/services.dart';
import 'package:soko_fe/Modals/products.dart';
import 'package:soko_fe/Screens/details.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();
  final String title =  "Soko";
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
      children: <Widget>[
        Flexible(
          child: FutureBuilder<List<Products>>(
            future: Services.getProducts(),
            builder: (context, snapshot) {
              // not setstate here
              //
              if (snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              }
              //
              if (snapshot.hasData) {
                streamController.sink.add(snapshot.data!.length);
                // gridview
                return gridview(snapshot);
              }

              return circularProgress();
            },
          ),
        ),
      ],
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







