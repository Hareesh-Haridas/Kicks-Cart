import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Data/Service/category/config.dart';
import 'package:kicks_cart/Domain/models/categoryModel/category_detail_model.dart';
import 'package:kicks_cart/Domain/models/categoryModel/category_model.dart';
import 'package:dio/dio.dart';

Future<List<BrandModel>> getCategories() async {
  String? authToken = await getAuthToken();
  print(authToken);
  try {
    final response = await Dio().get(getCategoryUrl,
        options: Options(headers: {'Authorization': '$authToken'}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<BrandModel> categories = (response.data['data'] as List)
          .map((json) => BrandModel.fromJson(json))
          .toList();
      return categories;
    } else {
      print('Failed to Fetch Categories');
      return [];
    }
  } catch (e) {
    print('Error Fetching Categories $e');
    return [];
  }
}

Future<List<CategoryDetailModel>> getCategoryDetail(String id) async {
  String? authToken = await getAuthToken();
  try {
    final response = await Dio().get('$getCategoryDetailUrl/$id',
        options: Options(headers: {'Authorization': '$authToken'}));
    print('Category Details-------- ${response.data}');
    bool status = response.data['status'];
    if (status) {
      List<CategoryDetailModel> products = (response.data['data'] as List)
          .map((json) => CategoryDetailModel.fromJson(json))
          .toList();
      return products;
    } else {
      print('Failed to Fetch Category Detail');
      return [];
    }
  } catch (e) {
    print('Error Fetching Category Detail $e');
    return [];
  }
}
