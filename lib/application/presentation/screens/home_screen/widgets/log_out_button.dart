import 'package:flutter/material.dart';
import 'package:kicks_cart/data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          await logOut(context);
        },
        icon: const Icon(
          Icons.exit_to_app,
          color: kWhite,
        ));
  }
}
