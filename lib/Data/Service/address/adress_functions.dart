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
      phoneNumber: 1,
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
    print(response.data);
    if (response.statusCode == 200 || response.statusCode == 201) {
      String addAddressMessage = response.data['message'];
      wishListShowSnackBar(context, addAddressMessage);
      Navigator.of(context).pop();
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
    print(response.data);
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

Future<void> deleteAddress(String id, BuildContext context) async {
  String? authToken = await getAuthToken();
  try {
    final response = await Dio().delete('$deleteAddressUrl/$id',
        options: Options(headers: {'Authorization': '$authToken'}));
    bool status = response.data['status'] ?? true;
    if (status) {
      String deleteMessage = response.data['message'];
      wishListShowSnackBar(context, deleteMessage);
    }
  } catch (e) {
    print('Error Deleting Address $e');
  }
}

Future<AddAddressModel> editAddress(
    String id,
    String name,
    int phoneNumber,
    String streetName,
    int postalCode,
    String cityName,
    String countryName,
    BuildContext context) async {
  String? authToken = await getAuthToken();
  AddAddressModel addAddressModel = AddAddressModel(
      name: '',
      phoneNumber: 1,
      streetName: '',
      postalCode: 0,
      cityName: '',
      countryName: '');
  Map<String, dynamic> addressData = {
    'name': name,
    'phoneNumber': phoneNumber,
    'streetName': streetName,
    'postalCode': postalCode,
    'cityName': cityName,
    'countryName': countryName,
    '_id': id
  };
  try {
    final response = await Dio().put(editAddressUrl,
        data: addressData,
        options: Options(headers: {'Authorization': '$authToken'}));
    bool status = response.data['status'] ?? true;

    if (status) {
      String editMessage = response.data['message'] ?? '';
      wishListShowSnackBar(context, editMessage);
      Navigator.of(context).pop();
      return addAddressModel;
    } else {
      print('Failed to edit Address');
      return addAddressModel;
    }
  } catch (e) {
    print('Error editing Address $e');
    return addAddressModel;
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
