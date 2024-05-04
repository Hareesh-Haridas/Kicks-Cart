import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/data/service/auth/authorization_functions.dart';

class ProfileLogoutButton extends StatefulWidget {
  const ProfileLogoutButton({super.key});

  @override
  State<ProfileLogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<ProfileLogoutButton> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        await logOut(context);
      },
      title: const Text('Log out'),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: kGrey),
          borderRadius: BorderRadius.circular(10)),
      trailing: const Icon(Icons.chevron_right_outlined),
    );
  }
}
