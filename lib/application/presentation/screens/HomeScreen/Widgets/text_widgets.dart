import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class GoodDayToShoppingText extends StatelessWidget {
  const GoodDayToShoppingText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Text(
        "Good Day to Shopping",
        style: TextStyle(color: kWhite),
      ),
    );
  }
}

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            "Welcome Hareesh Haridas",
            style: TextStyle(
              color: kWhite,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}

class PopularBrandsText extends StatelessWidget {
  const PopularBrandsText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth30,
        Text(
          "Popular Brands",
          style: TextStyle(
            color: kWhite,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
