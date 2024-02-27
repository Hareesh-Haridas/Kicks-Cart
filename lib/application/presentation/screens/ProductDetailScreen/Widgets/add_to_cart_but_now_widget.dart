import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class AddToCartBuyNowWidgets extends StatelessWidget {
  const AddToCartBuyNowWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.add_shopping_cart_outlined,
              color: kWhite,
            ),
            label: Text(
              'Add to Cart',
              style: TextStyle(color: kWhite),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: kBlueGrey),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Buy Now',
              style: TextStyle(color: kBlack),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: kAmber),
          )
        ],
      ),
    );
  }
}
