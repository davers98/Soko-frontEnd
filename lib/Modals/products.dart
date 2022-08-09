import 'package:flutter/foundation.dart';

class Products with ChangeNotifier {
  final String id;
  final String productname;
  final double price;
  final String image;
  final String description;
  bool isFavorite;

  Products(
      {required this.productname,
      required this.price,
      required this.image,
      required this.description,
      required this.id,
      this.isFavorite = false});
  // factory Products.fromJson(Map<String, dynamic> json) {
  //   return Products(
  //     productname: json['productname'] as String,
  //     price: json['price'] as int,
  //     image: json['image'] as String,
  //   );
  // }

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
