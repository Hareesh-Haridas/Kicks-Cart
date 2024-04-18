import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/data/Service/auth/authorization_functions.dart';
// import 'package:kicks_cart/Domain/models/order/get_order_model.dart';
import 'package:kicks_cart/application/presentation/screens/order_placed_screen/order_placed_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/data/service/order/config.dart';
import 'package:kicks_cart/domain/models/order/get_order_model.dart';

class OrderService {
  Future<void> placeorder(
      String addressId, String paymentMethod, BuildContext context) async {
    String? authToken = await getAuthToken();
    Map<String, dynamic> data = {
      'addressId': addressId,
      'paymentMethod': paymentMethod
    };
    try {
      final response = await Dio().post(placeOrderUrl,
          data: data,
          options: Options(headers: {'Authorization': '$authToken'}));
      bool status = response.data['status'] ?? false;
      String orderPlacedMessage = response.data['message'] ?? '';
      if (status) {
        if (context.mounted) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const OrderPlacedScreen()));
          placeOrderShowSnackBar(context, orderPlacedMessage);
        }
      }
    } catch (e) {
      debugPrint('Error Placing Order $e');
    }
  }

  Future<List<GetOrderModel>> getOrders() async {
    String? authToken = await getAuthToken();
    try {
      final response = await Dio().get(getOrderUrl,
          options: Options(headers: {'Authorization': '$authToken'}));
      // print(response.data['data']);

      List<dynamic> responseData = response.data['data'];

      List<GetOrderModel> results = [];

      for (var data in responseData) {
        var id = data["_id"] ?? '';

        if (data.containsKey('products') && data['products'] is List) {
          List<dynamic> productData = data['products'];

          for (var product in productData) {
            GetOrderModel orderModel = GetOrderModel.fromJson(product, id);
            results.add(orderModel);
          }
        }
      }

      return results;
    } catch (e) {
      debugPrint('Error Fetching orders $e');
      return [];
    }
  }

  Future<List<GetOrderModel>> getOrderDetails(String id) async {
    String? authToken = await getAuthToken();
    try {
      final response = await Dio().get('$getOrderDetailUrl/$id',
          options: Options(headers: {'Authorization': '$authToken'}));
      print(response.data);

      List<GetOrderModel> orders = (response.data['data'] as List)
          .map((json) => GetOrderModel.fromJson(json, id))
          .toList();
      return orders;
    } catch (e) {
      debugPrint('Error Fetching orders $e');
      return [];
    }
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
