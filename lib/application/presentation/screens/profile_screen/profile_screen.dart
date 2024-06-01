import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/profile_screen/widgets/about_button_widget.dart';
import 'package:kicks_cart/application/presentation/screens/profile_screen/widgets/address_button_widget.dart';
import 'package:kicks_cart/application/presentation/screens/profile_screen/widgets/logout_button_widget.dart';
import 'package:kicks_cart/application/presentation/screens/profile_screen/widgets/orders_button_widget.dart';
import 'package:kicks_cart/application/presentation/screens/profile_screen/widgets/profile_heading_widget.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              kHeight30,
              ProfileHeadingWidget(),
              kHeight38,
              AddressButton(),
              kHeight10,
              OrdersButton(),
              kHeight10,
              ProfileLogoutButton(),
              kHeight10,
              AboutButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}
