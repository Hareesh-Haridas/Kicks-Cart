import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/ProfileScreen/widgets/address_button_widget.dart';
import 'package:kicks_cart/application/presentation/screens/ProfileScreen/widgets/orders_button_widget.dart';
import 'package:kicks_cart/application/presentation/screens/ProfileScreen/widgets/profile_heading_widget.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              kHeight30,
              const ProfileHeadingWidget(),
              kHeight38,
              AddressButton(),
              kHeight10,
              OrdersButton(),
            ],
          ),
        ),
      ),
    );
  }
}
