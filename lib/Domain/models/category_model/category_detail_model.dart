class CategoryDetailModel {
  final List<dynamic> images;
  final String name;
  final int price;
  final String id;
  CategoryDetailModel(
      {required this.images,
      required this.name,
      required this.price,
      required this.id});
  factory CategoryDetailModel.fromJson(Map<String, dynamic> json) {
    return CategoryDetailModel(
        images: json['image'] != null ? List.from(json['image']) : [],
        name: json['name'] ?? '',
        price: json['price'] ?? 0,
        id: json['_id'] != null ? json['_id'].toString() : "");
  }
}
