import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductItem extends StatelessWidget {
  //const ProductItem({Key? key}) : super(key: key);

  final String id;
  final String productname;
  final double price;
  final String image;

  const ProductItem(
      {super.key,
      required this.id,
      required this.productname,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return GridTile(child: Image.network(image));
  }
}
