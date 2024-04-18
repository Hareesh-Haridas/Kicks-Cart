import 'package:dio/dio.dart';
import 'package:kicks_cart/data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/data/Service/products/config.dart';
import 'package:kicks_cart/Domain/models/product/getProductModel/get_product_model.dart';
import 'package:kicks_cart/Domain/models/product/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getProducts() async {
    String? authToken = await getAuthToken();
    try {
      final response = await Dio().get(getProductUrl,
          options: Options(headers: {'Authorization': '$authToken'}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        List<ProductModel> products = (response.data['data'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
        return products;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<GetProductModel> fetchProductDetail(String id) async {
    String? authToken = await getAuthToken();

    try {
      final response = await Dio().get('$fetchProductUrl/$id',
          options: Options(headers: {'Authorization': '$authToken'}));

      if (response.statusCode == 200 || response.statusCode == 201) {
        GetProductModel getProductModel =
            GetProductModel.fromJson(response.data['data']);

        return getProductModel;
      } else {
        return GetProductModel(
            productImage: [],
            productName: "",
            productPrice: 0,
            productDescription: "",
            stock: 0,
            category: "",
            message: '',
            id: '');
      }
    } catch (e) {
      return GetProductModel(
          productImage: [],
          productName: "",
          productPrice: 0,
          productDescription: "",
          stock: 0,
          category: "",
          message: '',
          id: '');
    }
  }

  Future<List<GetProductModel>> getSearchedProducts(String query) async {
    String? authToken = await getAuthToken();
    try {
      final response = await Dio().get('$searchProductUrl/$query',
          options: Options(headers: {'Authorization': 'Bearer $authToken'}));

      bool status = response.data['status'];
      if (status) {
        List<GetProductModel> products = (response.data['data'] as List)
            .map((json) => GetProductModel.fromJson(json))
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
