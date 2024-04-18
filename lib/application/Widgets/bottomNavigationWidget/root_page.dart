import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/application/widgets/bottomNavigationWidget/bottom_navigation.dart';
import 'package:kicks_cart/application/business_logic/bottom_nav/bloc/bottom_navigation_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/favorites_screen/favorite_screen.dart';
import 'package:kicks_cart/application/presentation/screens/home_screen/home_screen.dart';
import 'package:kicks_cart/application/presentation/screens/profile_screen/profile_screen.dart';
import 'package:kicks_cart/application/presentation/screens/store_screen/store_screen.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.index,
            children: screens,
          );
        },
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}

List<Widget> screens = [
  const HomeScreen(),
  const StoreScreen(),
  const FavoriteScreen(),
  const ProfileScreen()
];
