class WishListModel {
  final List<dynamic> image;
  final String name;
  final int price;
  final String id;

  WishListModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.id});
  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
        image: json['image'] != null ? List.from(json['image']) : [],
        name: json['name'] ?? '',
        price: json['price'] ?? 0,
        id: json['_id'] != null ? json['_id'].toString() : "");
  }
}
