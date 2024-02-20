import 'package:dio/dio.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Data/Service/products/config.dart';
import 'package:kicks_cart/Domain/models/product/product_model.dart';

Future<List<ProductModel>> getProducts() async {
  String? authToken = await getAuthToken();
  try {
    final response = await Dio().get(getProductUrl,
        options: Options(headers: {'Authorization': 'Bearer $authToken'}));
    print(response.data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<ProductModel> products = (response.data['data'] as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
      return products;
    } else {
      print('Failed to Fetch Products');
      return [];
    }
  } catch (e) {
    print('Error Fetching Products $e');
    return [];
  }
}
