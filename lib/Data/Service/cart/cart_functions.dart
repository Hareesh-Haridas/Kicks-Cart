import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Data/Service/cart/config.dart';
import 'package:kicks_cart/Domain/models/cart/addCartModel/add_to_cart_model.dart';
import 'package:kicks_cart/Domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

Future<void> addToCart(String id, BuildContext context, String size) async {
  String responseMessage = '';
  print('Cart url-----$addToCartUrl');
  String? authToken = await getAuthToken();
  AddToCartModel addToCartModel = AddToCartModel(id: "", message: "");
  try {
    final response = await Dio().post('$addToCartUrl/$id/$size',
        options: Options(headers: {'Authorization': '$authToken'}));

    print('Response message: ${response.data['message']}');
    responseMessage = response.data['message'];
    cartShowSnackBar(context, responseMessage);
  } catch (e) {
    print('Error Adding Cart $e');
  }
}

Future<List<GetCartModel>> getCart() async {
  String? authToken = await getAuthToken();
  try {
    final response = await Dio().get(getCartUrl,
        options: Options(headers: {'Authorization': '$authToken'}));
    if (response.statusCode == 200 || response.statusCode == 201) {
      // print('RESPONSE FROM GET CART ${response.data["datas"]}');
      List<GetCartModel> getCartModel = (response.data['datas'] as List)
          .map((json) => GetCartModel.fromJson(json))
          .toList();
      return getCartModel;
    } else {
      // print('Failed to Fetch Cart');
      return [];
    }
  } catch (e) {
    // print('Error Fetching Cart $e');
    return [];
  }
}

Future<void> deleteCart(String id, BuildContext context) async {
  String? authToken = await getAuthToken();
  try {
    final response = await Dio().delete('$deleteCartUrl/$id',
        options: Options(headers: {'Authorization': '$authToken'}));
    String deleteCartMessage = response.data['message'];
    cartShowSnackBar(context, deleteCartMessage);
  } catch (e) {
    print('Error deleting category $e');
  }
}

void cartShowSnackBar(BuildContext context, String message) {
  // print('snackbar is called');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: kWhite),
    ),
  ));
}
