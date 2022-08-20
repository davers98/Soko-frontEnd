import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soko_fe/Screens/productDetailScreen.dart';

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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ProductDetail(productname: productname),
            ),
          );
        },
        child: GridTile(
          // ignore: sort_child_properties_last
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
              backgroundColor: Colors.black54,
              trailing: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {},
              ),
              title: Text(productname, textAlign: TextAlign.left),
              subtitle: Text(
                price.toString(),
                textAlign: TextAlign.left,
              )),
        ),
      ),
    );
  }
}
