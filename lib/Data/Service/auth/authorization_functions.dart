import 'dart:convert';

import 'package:kicks_cart/Data/Service/auth/config.dart';
import 'package:kicks_cart/application/presentation/screens/accountcreationscreen/create_account_screen.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/loginscreen.dart';
import 'package:http/http.dart' as http;

void loginUser() async {
  if (lEmailController.text.isNotEmpty && lPasswordController.text.isNotEmpty) {
    print(lEmailController.text);
    var regBody = {
      "email": lEmailController.text,
      "password": lPasswordController.text
    };
    var response = await http.post(Uri.parse(resgistration),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody));
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status']) {
      var myToken = jsonResponse['token'];
      prefs.setString('token', myToken);
    } else {
      print('Something went wrong');
    }
  }
}

Future<void> signUp() async {
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
    print(regBody);
    var response = await http.post(Uri.parse(resgistration),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(regBody));
    var jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    var message = jsonResponse['message'];
    print(message);
  }
}
