import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/address/config.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Domain/models/address/add_address_model.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

import '../../../Domain/models/address/get_address_model.dart';

Future<AddAddressModel> addAddress(
    BuildContext context,
    String name,
    int phoneNumber,
    String streetName,
    int postalCode,
    String cityName,
    String countryName) async {
  AddAddressModel addAddressModel = AddAddressModel(
      name: '',
      phoneNumber: 0,
      streetName: '',
      postalCode: 0,
      cityName: '',
      countryName: '');
  String? authToken = await getAuthToken();
  Map<String, dynamic> addressData = {
    'name': name,
    'phoneNumber': phoneNumber,
    'streetName': streetName,
    'postalCode': postalCode,
    'cityName': cityName,
    'countryName': countryName
  };
  try {
    print(addressData);
    final response = await Dio().post(addAddressUrl,
        options: Options(headers: {'Authorization': '$authToken'}),
        data: addressData);
    if (response.statusCode == 200 || response.statusCode == 201) {
      String addAddressMessage = response.data['message'];
      wishListShowSnackBar(context, addAddressMessage);
      return addAddressModel;
    }
  } catch (e) {
    print('Error Adding Address $e');
    return addAddressModel;
  }
  return addAddressModel;
}

Future<List<GetAddressModel>> getAddress() async {
  String? authToken = await getAuthToken();
  try {
    final response = await Dio().get(getAddressUrl,
        options: Options(headers: {'Authorization': '$authToken'}));
    bool status = response.data['status'] ?? true;
    if (status) {
      List<GetAddressModel> getAddressModel = (response.data['data'] as List)
          .map((json) => GetAddressModel.fromJson(json))
          .toList();
      return getAddressModel;
    } else {
      print('Failed to Fetch Addresses');
      return [];
    }
  } catch (e) {
    print('Function Error Fetching Addresses $e');
    return [];
  }
}

void wishListShowSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(color: kWhite),
    ),
  ));
}
