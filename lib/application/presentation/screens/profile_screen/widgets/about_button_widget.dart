import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/about_screen/about_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class AboutButtonWidget extends StatelessWidget {
  const AboutButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('About'),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: kGrey),
          borderRadius: BorderRadius.circular(10)),
      trailing: const Icon(Icons.chevron_right_outlined),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const AboutScreen()));
      },
    );
  }
}
