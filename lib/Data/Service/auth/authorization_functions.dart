import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/auth/config.dart';
import 'package:kicks_cart/application/Widgets/bottomNavigationWidget/root_page.dart';
import 'package:kicks_cart/application/presentation/screens/Otp%20screen/otp_screen.dart';
import 'package:kicks_cart/application/presentation/screens/Otp%20screen/otp_success_screen.dart';
import 'package:kicks_cart/application/presentation/screens/accountcreationscreen/create_account_screen.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/loginscreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String loginMessage = "";
Future<void> loginUser(BuildContext context) async {
  try {
    if (lEmailController.text.isNotEmpty &&
        lPasswordController.text.isNotEmpty) {
      var regBody = {
        "email": lEmailController.text,
        "password": lPasswordController.text
      };
      var response = await http.post(Uri.parse(loginUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        bool statusMessage = jsonResponse['status'] ?? false;
        print(statusMessage);
        loginMessage = jsonResponse['message'] ?? "";
        if (statusMessage) {
          var myToken = jsonResponse['token'] ?? "";
          storeAuthToken(myToken);
          prefs.setString('token', myToken);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RootPage()));
        } else {
          showSnackBar(context, loginMessage);
        }
      } else {
        print(response.statusCode);
      }
    }
  } catch (e) {
    print("Exception during HTTP request: $e");
  }
}

String otp = "";
String message = "";
Future<void> signUp(BuildContext context) async {
  // print("sign up 1");

  if (sEmailController.text.isNotEmpty &&
      sPasswordController.text.isNotEmpty &&
      sNameController.text.isNotEmpty &&
      sPhoneNumberController.text.isNotEmpty) {
    var regBody = {
      "firstname": sNameController.text,
      "lastname": sLastNameController.text,
      "email": sEmailController.text,
      "password": sPasswordController.text,
      "mobile": sPhoneNumberController.text,
    };

    var response = await http.post(Uri.parse(resgistrationUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody));
    // signUpResponse = response.body;
    var jsonResponse = jsonDecode(response.body);
    // print(jsonResponse);
    message = jsonResponse['message'] ?? "";

    var data = jsonResponse['data'];
    otp = jsonResponse['otp'] ?? "";
    if (otp.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpScreen()));
    } else {
      showSnackBar(context, message);
    }
    print(otp);
    print(data);
    print(message);
  } else {
    print("sign up 4");
  }
}

String otpMessage = "";
Future<void> otpVerify(BuildContext context) async {
  if (otpController1.text.isNotEmpty &&
      otpController2.text.isNotEmpty &&
      otpController3.text.isNotEmpty &&
      otpController4.text.isNotEmpty) {
    String pin =
        "${otpController1.text}${otpController2.text}${otpController3.text}${otpController4.text}";
    // String data =
    //     "${sNameController.text}${sLastNameController.text}${sEmailController.text}${sPhoneNumberController.text}${sPasswordController.text}";

    var regBody = {
      "otp": pin,
      "oldotp": otp,
      "firstname": sNameController.text,
      "lastname": sLastNameController.text,
      "email": sEmailController.text,
      "password": sPasswordController.text,
      "mobile": sPhoneNumberController.text,
    };
    var response = await http.post(
      Uri.parse(verifyUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regBody),
    );

    var jsonResponse = jsonDecode(response.body);
    otpMessage = jsonResponse['message'] ?? "";
    if (otpMessage.isNotEmpty) {
      showSnackBar(context, otpMessage);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OptSuccessScreen()));
    }
    print(jsonResponse);
  }
}

String authTokenKey = 'authToken';
Future<void> storeAuthToken(String authToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(authTokenKey, authToken);
}

Future<String?> getAuthToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString(authTokenKey);
  return data;
}

Future<void> clearAuthToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove("authToken");
}

Future<void> logOut(BuildContext context) async {
  await clearAuthToken();
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginScreen()));
}

Future<void> clearSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}

Future<bool> checkFirstInstall() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstInstall = prefs.getBool('first_install') ?? true;
  if (isFirstInstall) {
    await prefs.setBool('first_install', false);
  }
  return isFirstInstall;
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
