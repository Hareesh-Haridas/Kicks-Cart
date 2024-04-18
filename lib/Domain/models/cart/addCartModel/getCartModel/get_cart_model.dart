class GetCartModel {
  final List<dynamic> image;
  final String name;
  final int price;
  final String size;
  final String id;
  final int stock;
  final int totalAmount;
  GetCartModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.size,
      required this.id,
      required this.stock,
      required this.totalAmount});
  factory GetCartModel.fromJson(Map<String, dynamic> json) {
    return GetCartModel(
        image: json['image'] != null ? List.from(json['image']) : [],
        name: json['name'] ?? '',
        price: json['price'] ?? 0,
        size: json['size'] ?? '',
        id: json['_id'] != null ? json['_id'].toString() : "",
        stock: json['quantity'] ?? 0,
        totalAmount: json['totalPrice'] ?? 0);
  }
}
