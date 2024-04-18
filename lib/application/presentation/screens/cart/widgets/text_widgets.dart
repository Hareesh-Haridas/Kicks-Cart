import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class MyCartText extends StatelessWidget {
  const MyCartText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth20,
        Text(
          'My Cart',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class QuantityText extends StatelessWidget {
  const QuantityText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth10,
        Text(
          'Quantity',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
        )
      ],
    );
  }
}
