import 'package:kicks_cart/data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/data/Service/category/config.dart';
// import 'package:kicks_cart/Domain/models/categoryModel/category_detail_model.dart';
// import 'package:kicks_cart/Domain/models/categoryModel/category_model.dart';
import 'package:dio/dio.dart';
import 'package:kicks_cart/domain/models/category_model/category_detail_model.dart';
import 'package:kicks_cart/domain/models/category_model/category_model.dart';

class CategoryService {
  Future<List<BrandModel>> getCategories() async {
    String? authToken = await getAuthToken();
    try {
      final response = await Dio().get(getCategoryUrl,
          options: Options(headers: {'Authorization': '$authToken'}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<BrandModel> categories = (response.data['data'] as List)
            .map((json) => BrandModel.fromJson(json))
            .toList();
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<CategoryDetailModel>> getCategoryDetail(String id) async {
    String? authToken = await getAuthToken();
    try {
      final response = await Dio().get('$getCategoryDetailUrl/$id',
          options: Options(headers: {'Authorization': '$authToken'}));

      bool status = response.data['status'];
      if (status) {
        List<CategoryDetailModel> products = (response.data['data'] as List)
            .map((json) => CategoryDetailModel.fromJson(json))
            .toList();
        return products;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
