import 'package:shared_preferences/shared_preferences.dart';

void setFirstTimeFlag() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool("firstTime", false);
}
