import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/loginscreen.dart';
import 'package:kicks_cart/application/presentation/screens/onboardingscreens/functions/onboading_functions.dart';
import 'package:kicks_cart/application/presentation/screens/onboardingscreens/onboarding_data.dart';
import 'package:kicks_cart/application/presentation/screens/onboardingscreens/onboarding_page.dart';
import 'package:kicks_cart/application/presentation/screens/onboardingscreens/widgets/onboarding_widgets.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({super.key});

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  final List<OnboardingData> onboardingData = [
    OnboardingData(
        skip: "Skip",
        animationAsset: "assets/animations/search.json",
        title: "Search your product",
        subtitle:
            "Welcome to a World of Limitless Choices-Your\n                   Perfect Product Awaits!"),
    OnboardingData(
        skip: "Skip",
        animationAsset: "assets/animations/paymentMethod.json",
        title: "Select Payment Method",
        subtitle:
            "For Seamless Transactions, Choose Your Payment\n                 path-Your Convenience, Our Priority! "),
    OnboardingData(
        skip: "Skip",
        animationAsset: "assets/animations/deliver.json",
        title: "Delivery at Door Step",
        subtitle:
            "From our door step to yours-Swift, Secure,and\n                  Contactless delivery")
  ];
  int currentIndex = 0;
  final PageController _pageController = PageController();
  @override
  void initState() {
    checkFirstTime();
    super.initState();
  }

  void checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('firstTime') ?? true;
    if (!isFirstTime) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  return OnboardingPage(
                    data: onboardingData[index],
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
            kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => buildIndicator(index),
              ),
            ),
            kHeight30,
            onboardingElevatedButton(
                currentIndex: currentIndex,
                onboardingData: onboardingData,
                pageController: _pageController),
            kHeight20
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: currentIndex == index ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(4)),
    );
  }
}
