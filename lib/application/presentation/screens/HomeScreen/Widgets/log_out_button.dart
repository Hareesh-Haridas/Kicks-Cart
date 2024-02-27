import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class logOutButton extends StatelessWidget {
  const logOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          await logOut(context);
        },
        icon: Icon(
          Icons.exit_to_app,
          color: kWhite,
        ));
  }
}
