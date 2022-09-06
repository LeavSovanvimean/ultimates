// import 'dart:convert';

// List<Product> productFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

// String productToJson(List<Product> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Product {
//   final int id;
//   final String productName, description, category;
//   final List<String> images;
//   final double rating, price;
//   final bool isFavourite, isPopular;

//   Product(
//       {required this.id,
//       required this.images,
//       this.rating = 0.0,
//       this.isFavourite = false,
//       this.isPopular = false,
//       required this.productName,
//       required this.price,
//       required this.description,
//       this.category = 'Category'});

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//         id: json['id'],
//         images: json['photo'],
//         productName: json['productName'],
//         price: json['Price'],
//         description: json['desc']);
//   }

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "images": images,
//         "productName": productName,
//         "price": price,
//         "description": description,
//       };
// }

class Product {
  final int id;
  final String productName, description, category;
  final List<String> images;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product(
      {required this.id,
      required this.images,
      this.rating = 0.0,
      this.isFavourite = false,
      this.isPopular = false,
      required this.productName,
      required this.price,
      required this.description,
      this.category = 'Category'});
}
