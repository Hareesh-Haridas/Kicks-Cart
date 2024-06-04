import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/application/business_logic/wishlist/bloc/bloc/wish_list_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/favorites_screen/widgets/heading_widget.dart';
import 'package:kicks_cart/application/presentation/screens/favorites_screen/widgets/wish_list_products.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late WishListBloc wishList;
  @override
  void initState() {
    super.initState();
    wishList = context.read<WishListBloc>();
    wishList.add(FetchwishListEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    wishList = context.read<WishListBloc>();
    wishList.add(FetchwishListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              kHeight30,
              const HeadingWidget(),
              kHeight30,
              Expanded(
                child: FavoriteProducts(
                  context: context,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
