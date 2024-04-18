import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class EditAddressHeading extends StatelessWidget {
  const EditAddressHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth30,
        Text(
          'Edit Address',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
