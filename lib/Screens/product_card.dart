import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soko_fe/Modals/products.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:soko_fe/Services/services.dart';
import 'package:soko_fe/Screens/details.dart';



class ProductCell extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ProductCell(this.products, this.context);

  @required
  final Products products;


  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 10.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Image.network("Heoolo",
                width: 150,
                height: 150,
                ),

              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  products.productname,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,

                ),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    products.price.toString(),
                    maxLines: 1,
                    softWrap: true,
                    textAlign: TextAlign.right,
                  ),)
            ],
          ),
        ),
      ),
    );

  }
}


//class ProductCard{
//
//
//  late Future<Products> futureProducts;
//
//  @override
//  void initState(){
//
//      futureProducts = fetchProducts();
//
//  }
//
//
//    GestureDetector getStructuredGridCell(image, name, price){
//      return GestureDetector(
//        onTap: () { print("on Tapped called");},
//        child: Card(
//          elevation: 2.0,
//          shape: const RoundedRectangleBorder(
//            borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(8.0),
//              topRight: Radius.circular(8.0)
//            )
//          ),
//          child: Column(
//
//            children: <Widget>[
//              Image(image: AssetImage("" + image)),
//              Center(
//              child: Text(name),
//
//              ),
//              Center(
//                child: Text(price),
//              )
//            ],
//          ),
//        ),
//      );
//
//
//    }
//    GridView build(){
//      return GridView.count(
//        primary: true,
//        padding: EdgeInsets.all(2.0),
//        crossAxisCount: 2,
//        childAspectRatio: 0.85,
//        mainAxisSpacing: 1.0,
//        crossAxisSpacing: 6.0,
//        children: <Widget>[
//          getStructuredGridCell("sample","sample","sample"),
//          getStructuredGridCell("sample","sample","sample"),
//          getStructuredGridCell("sample","sample","sample"),
//          getStructuredGridCell("sample","sample","sample"),
//        ],
//      );
//    }
//
//
//
//}
//
//Future<Products> fetchProducts() async{
//  final response = await http
//      .get(Uri.parse('http://67.205.140.117/api/products'));
//  if(response.statusCode == 200){
//    return Products.fromJson(json.decode(response.body));
//  }else{
//    throw Exception('Failed to Load Products');
//  }
//}

