import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void setFirstTimeFlag() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("firstTime", false);
}
