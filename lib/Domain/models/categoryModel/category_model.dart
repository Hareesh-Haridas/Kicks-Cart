import 'package:kicks_cart/Data/Service/auth/config.dart';

class BrandModel {
  final String name;
  final dynamic image;
  final String id;

  BrandModel({required this.name, required this.image, required this.id});
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
        name: json['name'] ?? '',
        image: json['image'] != null
            ? '$baseUrl/categories/' + json['image'].toString()
            : "",
        id: json['_id'] != null ? json['_id'].toString() : "");
  }
}
