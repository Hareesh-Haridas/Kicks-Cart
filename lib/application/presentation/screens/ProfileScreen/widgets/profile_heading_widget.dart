import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ProfileHeadingWidget extends StatelessWidget {
  const ProfileHeadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth20,
        Text(
          'Profile',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        kWidth10,
        Icon(Icons.person_outline)
      ],
    );
  }
}
