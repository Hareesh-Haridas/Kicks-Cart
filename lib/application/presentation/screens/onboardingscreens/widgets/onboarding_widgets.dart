import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/loginscreen.dart';
import 'package:kicks_cart/application/presentation/screens/onboardingscreens/functions/onboading_functions.dart';
import 'package:kicks_cart/application/presentation/screens/onboardingscreens/onboarding_data.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class OnboardingElevatedButton extends StatelessWidget {
  const OnboardingElevatedButton({
    super.key,
    required this.currentIndex,
    required this.onboardingData,
    required PageController pageController,
  }) : _pageController = pageController;

  final int currentIndex;
  final List<OnboardingData> onboardingData;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey[900],
      ),
      onPressed: () {
        if (currentIndex < onboardingData.length - 1) {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        } else {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
          setFirstTimeFlag();
        }
      },
      child: Text(
        currentIndex < onboardingData.length - 1 ? "Next" : "Get Started",
        style: const TextStyle(color: kWhite),
      ),
    );
  }
}
