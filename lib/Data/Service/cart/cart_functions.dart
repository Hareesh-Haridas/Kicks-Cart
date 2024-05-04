import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/data/Service/cart/config.dart';
// import 'package:kicks_cart/Domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';

class CartService {
  Future<void> addToCart(String id, BuildContext context, String size) async {
    String responseMessage = '';

    String? authToken = await getAuthToken();
    try {
      final response = await Dio().post('$addToCartUrl/$id/$size',
          options: Options(headers: {'Authorization': '$authToken'}));

      responseMessage = response.data['message'];
      if (context.mounted) {
        cartShowSnackBar(context, responseMessage);
      }
    } catch (e) {
      debugPrint('Error adding to cart $e');
    }
  }

  Future<List<GetCartModel>> getCart() async {
    String? authToken = await getAuthToken();

    final response = await Dio().get(getCartUrl,
        options: Options(headers: {'Authorization': '$authToken'}));

    try {
      bool status = response.data['status'] ?? false;
      if (status) {
        List<GetCartModel> getCartModel = (response.data['datas'] as List)
            .map((json) => GetCartModel.fromJson(json))
            .toList();

        return getCartModel;
      } else {
        debugPrint('Failed to Fetch Cart');
        return [];
      }
    } catch (e) {
      debugPrint('Error Fetching Cart $e');
      return [];
    }
  }

  Future<void> editQuantity(int value, String id, BuildContext context) async {
    String? authToken = await getAuthToken();
    Map<String, dynamic> data = {'value': value, 'id': id};
    try {
      final response = await Dio().post(editCartUrl,
          data: data,
          options: Options(headers: {'Authorization': '$authToken'}));
      bool status = response.data['status'] ?? false;
      String editQuantitymessage = response.data['message'] ?? '';

      cartShowSnackBar(context, editQuantitymessage);

      if (status) {
        getCart();
      }
    } catch (e) {
      debugPrint('Error editing Quantity $e');
    }
  }

  Future<int> getTotalAmount() async {
    String? authToken = await getAuthToken();
    try {
      final response = await Dio().get(getCartUrl,
          options: Options(headers: {'Authorization': '$authToken'}));
      print(response.data['totalPrice']);
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
      final response = await Dio().delete(
        '$deleteCartUrl/$id',
        options: Options(
          headers: {'Authorization': '$authToken'},
        ),
      );
      String deleteCartMessage = response.data['message'];

      cartShowSnackBar(context, deleteCartMessage);
    } catch (e) {
      debugPrint('Error deleting category $e');
    }
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
