import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Wishlist',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        kWidth10,
        Icon(Icons.favorite_border_outlined)
      ],
    );
  }
}
