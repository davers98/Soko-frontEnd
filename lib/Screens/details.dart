import 'package:flutter/material.dart';
import 'package:soko_fe/Modals/products.dart';

class GridDetails extends StatefulWidget {
  final Products curProduct;
  GridDetails({required this.curProduct});

  @override
  GridDetailsState createState() => GridDetailsState();
}

class GridDetailsState extends State<GridDetails> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "image${widget.curProduct.productname}",
              child: FadeInImage.assetNetwork(
                placeholder: "images/no_image.png",
                image: widget.curProduct.image,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
//            OutlineButton(
//              child: Icon(Icons.close),
//              onPressed: () => Navigator.of(context).pop(),
//            ),
          ],
        ),
      ),
    );
  }
}