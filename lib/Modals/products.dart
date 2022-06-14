
class Products{
  final String productname;
  final int price;
  final String image;
  
  const Products({
    required this.productname,
    required this.price,
    required this.image,
});
  factory Products.fromJson(Map<String, dynamic> json){
    return Products(
      productname: json['productname'] as String,
      price: json['price'] as int,
      image: json['image'] as String,);
  }

}