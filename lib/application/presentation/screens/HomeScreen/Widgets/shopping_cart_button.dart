import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.shopping_cart_outlined,
        color: kWhite,
      ),
    );
  }
}
