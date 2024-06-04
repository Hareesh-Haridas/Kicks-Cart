class GetProductModel {
  final List<dynamic> productImage;
  final String productName;
  final int productPrice;
  final String productDescription;
  final int stock;
  final String category;
  final String message;
  final String id;
  final bool isFavorite;

  GetProductModel({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.stock,
    required this.category,
    required this.message,
    required this.id,
    this.isFavorite = false,
  });
  factory GetProductModel.fromJson(Map<String, dynamic> json) {
    return GetProductModel(
      productImage: json['image'] != null ? List.from(json['image']) : [],
      productName: json['name'] ?? '',
      productPrice: json['price'] ?? 0,
      productDescription: json['description'] ?? '',
      stock: json['stock'] ?? 0,
      category: json['category'] ?? '',
      message: json['message'] ?? '',
      id: json['_id'] != null ? json['_id'].toString() : "",
    );
  }
}
