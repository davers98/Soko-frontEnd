import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soko_fe/Screens/productItem.dart';

class ProductDetail extends StatelessWidget {
  final String productname;
  const ProductDetail({
    Key? key,
    required this.productname,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productname),
      ),
    );
  }
}
