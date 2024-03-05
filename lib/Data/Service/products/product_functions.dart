import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Data/Service/products/config.dart';
import 'package:kicks_cart/Domain/models/product/getProductModel/get_product_model.dart';
import 'package:kicks_cart/Domain/models/product/product_model.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/product_detail_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

Future<List<ProductModel>> getProducts() async {
  String? authToken = await getAuthToken();
  try {
    final response = await Dio().get(getProductUrl,
        options: Options(headers: {'Authorization': '$authToken'}));
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

Future<GetProductModel> fetchProductDetail(String id) async {
  String? authToken = await getAuthToken();

  try {
    final response = await Dio().get('$fetchProductUrl/$id',
        options: Options(headers: {'Authorization': '$authToken'}));
    print(response.data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      GetProductModel getProductModel =
          GetProductModel.fromJson(response.data['data']);

      return getProductModel;
    } else {
      print('Failed to fetch products');
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
    print('Error fetching products $e');
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
  print('SEARCH PRODUCT FUNCTION CALLED///////');
  print('$searchProductUrl/$query');
  String? authToken = await getAuthToken();
  try {
    final response = await Dio().get('$searchProductUrl/$query',
        options: Options(headers: {'Authorization': 'Bearer $authToken'}));
    print('Search Result-------${response.data}');
    bool status = response.data['status'];
    if (status) {
      List<GetProductModel> products = (response.data['data'] as List)
          .map((json) => GetProductModel.fromJson(json))
          .toList();
      return products;
    } else {
      print('failed to search products');
      return [];
    }
  } catch (e) {
    print('Error Searching products $e');
    return [];
  }
}
