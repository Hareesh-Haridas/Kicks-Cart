import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Data/Service/cart/config.dart';
import 'package:kicks_cart/Domain/models/cart/addCartModel/add_to_cart_model.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

Future<void> addToCart(String id, BuildContext context) async {
  String responseMessage = '';
  print('Cart url-----$addToCartUrl');
  String? authToken = await getAuthToken();
  AddToCartModel addToCartModel = AddToCartModel(id: "", message: "");
  try {
    final response = await Dio().post('$addToCartUrl/$id',
        options: Options(headers: {'Authorization': '$authToken'}));
    print('Response message: ${response.data['message']}');
    responseMessage = response.data['message'];
    cartShowSnackBar(context, responseMessage);
  } catch (e) {
    print('Error Adding Cart $e');
  }
}

void cartShowSnackBar(BuildContext context, String message) {
  print('snackbar is called');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: kWhite),
    ),
  ));
}
