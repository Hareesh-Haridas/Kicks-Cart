import 'package:kicks_cart/Data/Service/auth/config.dart';

class ProductModel {
  final List<dynamic> productImage;
  final String productName;
  final int productPrice;
  final String productDescription;
  final int stock;
  final String category;
  String message;
  ProductModel({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.stock,
    required this.category,
    required this.message,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      message: "",
      productImage: json['image'] != null ? List.from(json['image']) : [],
      productName: json['name'] ?? '',
      productPrice: json['price'] ?? 0,
      productDescription: json['description'] ?? '',
      stock: json['stock'] ?? 0,
      category: json['category'] ?? '',
    );
  }
}
