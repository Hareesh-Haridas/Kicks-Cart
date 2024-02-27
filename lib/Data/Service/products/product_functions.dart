import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Data/Service/products/config.dart';
import 'package:kicks_cart/Domain/models/product/getProductModel/get_product_model.dart';
import 'package:kicks_cart/Domain/models/product/product_model.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/product_detail_screen.dart';

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

Future<GetProductModel> fetchProductDetail(
    String id, BuildContext context) async {
  String? authToken = await getAuthToken();

  try {
    final response = await Dio().get('$fetchProductUrl/$id',
        options: Options(headers: {'Authorization': 'Bearer $authToken'}));
    print(response.data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      GetProductModel getProductModel =
          GetProductModel.fromJson(response.data['data']);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductDetailScreen(
              name: getProductModel.productName,
              price: getProductModel.productPrice,
              description: getProductModel.productDescription,
              stock: getProductModel.stock,
              id: getProductModel.id)));
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
