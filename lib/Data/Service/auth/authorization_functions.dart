import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/auth/config.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/home_screen.dart';
import 'package:kicks_cart/application/presentation/screens/Otp%20screen/otp_screen.dart';
import 'package:kicks_cart/application/presentation/screens/Otp%20screen/otp_success_screen.dart';
import 'package:kicks_cart/application/presentation/screens/accountcreationscreen/create_account_screen.dart';
import 'package:kicks_cart/application/presentation/screens/accountcreationscreen/widgets/account_creation_widgets.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/loginscreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String loginMessage = "";
Future<void> loginUser(BuildContext context) async {
  if (lEmailController.text.isNotEmpty && lPasswordController.text.isNotEmpty) {
    print(lEmailController.text);
    var regBody = {
      "email": lEmailController.text,
      "password": lPasswordController.text
    };
    var response = await http.post(Uri.parse(loginUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody));
    var jsonResponse = jsonDecode(response.body);
    bool statusMessage = jsonResponse['status'] ?? false;
    loginMessage = jsonResponse['message'];
    if (statusMessage) {
      var myToken = jsonResponse['token'];
      print(myToken);
      prefs.setString('token', myToken);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      showSnackBar(context, loginMessage);
    }
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

class SessionManager {
  static const String authTokenKey = 'authToken';
  static Future<void> storeAuthToken(String authToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(authTokenKey, authToken);
  }

  static Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString(authTokenKey);
  }

  static Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
