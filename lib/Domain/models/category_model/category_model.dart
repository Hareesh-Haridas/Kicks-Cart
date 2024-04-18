import 'package:kicks_cart/data/Service/auth/config.dart';

class BrandModel {
  final String name;
  final dynamic image;
  final String id;

  BrandModel({required this.name, required this.image, required this.id});
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
        name: json['name'] ?? '',
        image:
            json['image'] != null ? '$baseUrl/categories/${json['image']}' : "",
        id: json['_id'] != null ? json['_id'].toString() : "");
  }
}
