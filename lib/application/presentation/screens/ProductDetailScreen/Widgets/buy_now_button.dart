import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class BuyNowButton extends StatelessWidget {
  const BuyNowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              // Your onPressed logic here
            },
            color: Colors.amber,
            textColor: kWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            height: 50,
            minWidth: 300,
            child: const Row(
              children: [
                kWidth30,
                Text(
                  'Buy Now',
                  style: TextStyle(color: kBlack, fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
