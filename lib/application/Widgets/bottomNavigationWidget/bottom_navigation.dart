import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kicks_cart/application/business_logic/bottom_nav/bloc/bottom_navigation_bloc.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 20,
        ),
        child: GNav(
          onTabChange: (value) {
            context
                .read<BottomNavigationBloc>()
                .add(IndexChangerEvent(index: value));
          },
          activeColor: kWhite,
          tabBackgroundColor: Colors.amber,
          gap: 8,
          padding: const EdgeInsets.all(11),
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
              iconColor: kWhite,
            ),
            GButton(
              icon: Icons.store,
              text: 'Store',
              iconColor: kWhite,
            ),
            GButton(
              icon: Icons.favorite_border,
              text: 'Favorites',
              iconColor: kWhite,
            ),
            GButton(
              icon: Icons.person_2_outlined,
              text: 'Profile',
              iconColor: kWhite,
            )
          ],
        ),
      ),
    );
  }
}
