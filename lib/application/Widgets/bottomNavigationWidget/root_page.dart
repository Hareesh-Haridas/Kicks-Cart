import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/application/Widgets/bottomNavigationWidget/bottom_navigation.dart';
import 'package:kicks_cart/application/business%20logic/bottomNav/bloc/bottom_navigation_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/FavoritesScreen/favorite_screen.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/home_screen.dart';
import 'package:kicks_cart/application/presentation/screens/ProfileScreen/profile_screen.dart';
import 'package:kicks_cart/application/presentation/screens/StoreScreen/store_screen.dart';

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
