import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/data/Service/auth/authorization_functions.dart';
// import 'package:kicks_cart/Domain/models/order/get_order_model.dart';
import 'package:kicks_cart/application/presentation/screens/order_placed_screen/order_placed_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/data/service/order/config.dart';
import 'package:kicks_cart/domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';
import 'package:kicks_cart/domain/models/order/get_order_model.dart';

String orderId = '';

class OrderService {
  Future<void> placeorder(
    String addressId,
    String paymentMethod,
    BuildContext context,
  ) async {
    String? authToken = await getAuthToken();
    Map<String, dynamic> data = {
      'addressId': addressId,
      'paymentMethod': paymentMethod
    };
    try {
      final response = await Dio().post(placeOrderUrl,
          data: data,
          options: Options(headers: {'Authorization': '$authToken'}));
      print(response.data);
      bool status = response.data['status'] ?? false;
      String orderPlacedMessage = response.data['message'] ?? '';
      orderId = response.data['orderId'] ?? '';
      if (status) {
        if (context.mounted) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => OrderPlacedScreen()));
          placeOrderShowSnackBar(context, orderPlacedMessage);
        }
      }
    } catch (e) {
      debugPrint('Error Placing Order $e');
    }
  }

  Future<void> placeSingleProductOrder(
    String addressId,
    String productId,
    String paymentMethod,
    BuildContext context,
    String size,
  ) async {
    String? authToken = await getAuthToken();
    var regBody = {
      'productId': productId,
      'size': size,
      'addressId': addressId,
      'paymentMethod': paymentMethod
    };
    try {
      final response = await Dio().post(placeSingleProductUrl,
          data: regBody,
          options: Options(headers: {'Authorization': '$authToken'}));
      bool status = response.data['status'] ?? false;
      String orderPlacedMessage = response.data['message'] ?? '';
      orderId = response.data['orderId'] ?? '';
      if (status) {
        if (context.mounted) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => OrderPlacedScreen()));
          placeOrderShowSnackBar(context, orderPlacedMessage);
        }
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<List<GetOrderModel>> getOrders() async {
    String? authToken = await getAuthToken();
    try {
      final response = await Dio().get(getOrderUrl,
          options: Options(headers: {'Authorization': '$authToken'}));

      List<dynamic> responseData = response.data['data'];

      List<GetOrderModel> results = [];

      for (var data in responseData) {
        var id = data["_id"] ?? '';
        String orderStatus = data['curentStatus'] ?? '';
        if (data.containsKey('products') && data['products'] is List) {
          List<dynamic> productData = data['products'];

          for (var product in productData) {
            GetOrderModel orderModel =
                GetOrderModel.fromJson(product, id, orderStatus, '', 0, '');
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

      var data = response.data['data'];
      if (data is List && data.isNotEmpty) {
        var ind = data.length - 1;
        var orderDetails = data[0];
        print(response.data);

        // Access the last element of the list
        String addressName = data[ind]['name'] ?? '';
        int phoneNumber = data[ind]['phoneNumber'] ?? 0;
        String cityName = data[ind]['cityName'] ?? '';
        String orderStatus = orderDetails['status'] ?? '';

        List<GetOrderModel> orders = data
            .map<GetOrderModel>((json) => GetOrderModel.fromJson(
                json, id, orderStatus, addressName, phoneNumber, cityName))
            .toList();

        return orders;
      } else {
        debugPrint('No orders found');
        return [];
      }
    } catch (e) {
      debugPrint('Error Fetching orders: $e');
      return [];
    }
  }
}

Future<void> cancelOrder(String id, BuildContext context) async {
  String? authToken = await getAuthToken();
  try {
    final response = await Dio().post('$cancelOrderUrl/$id',
        options: Options(headers: {'Authorization': '$authToken'}));
    String cancelMessage = response.data['message'];
    if (context.mounted) {
      placeOrderShowSnackBar(context, cancelMessage);
    }
  } catch (e) {
    debugPrint('Error cancelling orders $e');
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
