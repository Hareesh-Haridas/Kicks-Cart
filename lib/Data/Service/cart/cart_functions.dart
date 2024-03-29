import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Data/Service/cart/config.dart';
import 'package:kicks_cart/Domain/models/cart/addCartModel/add_to_cart_model.dart';
import 'package:kicks_cart/Domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';
import 'package:kicks_cart/Domain/models/cart/total_amount/total_amount_model.dart';
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

Future<int> getTotalAmount() async {
  String? authToken = await getAuthToken();
  try {
    final response = await Dio().get(getCartUrl,
        options: Options(headers: {'Authorization': '$authToken'}));
    bool status = response.data['status'];

    if (status) {
      int totalPrice = response.data['totalPrice'];

      return totalPrice;
    } else {
      return 0;
    }
  } catch (e) {
    return 0;
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

Future<void> editQuantity(int value, String id, BuildContext context) async {
  String? authToken = await getAuthToken();
  Map<String, dynamic> data = {'value': value, 'id': id};
  try {
    print(data);
    final response = await Dio().post(editCartUrl,
        data: data, options: Options(headers: {'Authorization': '$authToken'}));
    bool status = response.data['status'] ?? false;
    String editQuantitymessage = response.data['message'] ?? '';
    cartShowSnackBar(context, editQuantitymessage);
    if (status) {
      getCart();
    }
  } catch (e) {
    print('Error editing Quantity $e');
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
