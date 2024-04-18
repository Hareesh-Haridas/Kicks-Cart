import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      // backgroundColor: Color.fromARGB(255, 26, 41, 49),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/splashscreenimage/kicksCartLogo.png'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
