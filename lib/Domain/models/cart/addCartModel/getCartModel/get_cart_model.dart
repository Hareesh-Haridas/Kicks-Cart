class GetCartModel {
  final List<dynamic> image;
  final String name;
  final int price;
  final String size;
  final String id;

  GetCartModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.size,
      required this.id});
  factory GetCartModel.fromJson(Map<String, dynamic> json) {
    return GetCartModel(
        image: json['image'] != null ? List.from(json['image']) : [],
        name: json['name'] ?? '',
        price: json['price'] ?? 0,
        size: json['size'] ?? '',
        id: json['_id'] != null ? json['_id'].toString() : "");
  }
}
