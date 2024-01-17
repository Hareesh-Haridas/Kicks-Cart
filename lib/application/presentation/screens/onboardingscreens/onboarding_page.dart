import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/loginscreen.dart';
import 'package:kicks_cart/application/presentation/screens/onboardingscreens/onboarding_data.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  const OnboardingPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Text(
                    data.skip,
                    style: TextStyle(
                        fontWeight: FontWeight.w800, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
            kHeight38,
            Lottie.asset(
              data.animationAsset,
              height: 300,
              fit: BoxFit.cover,
            ),
            kHeight20,
            Text(
              data.title,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
            kHeight20,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(data.subtitle),
            ),
          ],
        ),
      ),
    );
  }
}
