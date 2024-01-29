import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/Otp%20screen/otp_screen.dart';
import 'package:kicks_cart/application/presentation/screens/onboardingscreens/onboardingscreen_1.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme:
              GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)),
      home: AnimatedSplashScreen(
        splash: Text(
          'Kicks Cart',
          style: GoogleFonts.bangers(fontSize: 40),
        ),
        nextScreen: const OnboardingScreen1(),
        splashTransition: SplashTransition.slideTransition,
      ),
    );
  }
}
