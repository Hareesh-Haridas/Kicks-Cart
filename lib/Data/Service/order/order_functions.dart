import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Data/Service/order/config.dart';
import 'package:kicks_cart/Domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

Future<void> placeorder(
    String addressId, String paymentMethod, BuildContext context) async {
  String? authToken = await getAuthToken();
  Map<String, dynamic> data = {
    'addressId': addressId,
    'paymentMethod': paymentMethod
  };
  try {
    final response = await Dio().post(placeOrderUrl,
        data: data, options: Options(headers: {'Authorization': '$authToken'}));
    bool status = response.data['status'] ?? false;
    String orderPlacedMessage = response.data['message'] ?? '';
    if (status) {
      placeOrderShowSnackBar(context, orderPlacedMessage);
    }
  } catch (e) {
    print('Error Placing Order $e');
  }
}

void placeOrderShowSnackBar(BuildContext context, String message) {
  // print('snackbar is called');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: kWhite),
    ),
  ));
}
