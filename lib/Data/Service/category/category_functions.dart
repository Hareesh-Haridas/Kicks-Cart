import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Data/Service/category/config.dart';
import 'package:kicks_cart/Domain/models/categoryModel/category_model.dart';
import 'package:dio/dio.dart';

Future<List<BrandModel>> getCategories() async {
  String? authToken = await getAuthToken();
  print(authToken);
  try {
    final response = await Dio().get(getCategoryUrl,
        options: Options(headers: {'Authorization': 'Bearer $authToken'}));
    print(response.data);
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
