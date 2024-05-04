import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/data/Service/favorites/config.dart';
// import 'package:kicks_cart/Domain/models/wishlist/get_wishlist_model.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/domain/models/wishlist/get_wishlist_model.dart';

class WishListService {
  Future<void> addFavorite(String id, BuildContext context) async {
    String? authToken = await getAuthToken();
    try {
      final response = await Dio().post('$addWishListUrl/$id',
          options: Options(headers: {'Authorization': '$authToken'}));
      String favResponseMessage = response.data['message'];
      if (context.mounted) {
        wishListShowSnackBar(context, favResponseMessage);
      }
    } catch (e) {
      debugPrint('Error adding to wishlist $e');
    }
  }

  Future<List<WishListModel>> getFavorite() async {
    String? authToken = await getAuthToken();
    try {
      final response = await Dio().get(getWishListUrl,
          options: Options(headers: {'Authorization': '$authToken'}));
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<WishListModel> wishListModel = (response.data['data'] as List)
            .map((json) => WishListModel.fromJson(json))
            .toList();
        return wishListModel;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> deleteFavorite(String id, BuildContext context) async {
    String? authToken = await getAuthToken();
    try {
      final response = await Dio().delete('$deleteWishListUrl/$id',
          options: Options(headers: {'Authorization': '$authToken'}));
      final deleteFavMessage = response.data['message'];
      if (context.mounted) {
        wishListShowSnackBar(context, deleteFavMessage);
      }
    } catch (e) {
      debugPrint('Error deleting Wishlist $e');
    }
  }
}

void wishListShowSnackBar(BuildContext context, String message) {
  // print('snackbar is called');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: kWhite),
    ),
  ));
}
