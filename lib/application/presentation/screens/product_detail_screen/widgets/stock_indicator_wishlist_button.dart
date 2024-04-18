import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Data/Service/favorites/favorites_functions.dart';

import 'package:kicks_cart/application/business_logic/wishlist/bloc/bloc/wish_list_bloc.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class StockIndicatorWishlistWidget extends StatefulWidget {
  final String id;
  final int stock;
  const StockIndicatorWishlistWidget({
    super.key,
    required this.stock,
    required this.id,
  });

  @override
  State<StockIndicatorWishlistWidget> createState() =>
      _StockIndicatorWishlistWidgetState();
}

class _StockIndicatorWishlistWidgetState
    extends State<StockIndicatorWishlistWidget> {
  WishListService wishListService = WishListService();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.stock > 0
              ? const Text(
                  'In Stock',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold, color: kGreen),
                )
              : const Text(
                  'Out of Stock',
                  style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold, color: kRed),
                ),
          ElevatedButton.icon(
              onPressed: () async {
                await wishListService
                    .addFavorite(widget.id, context)
                    .whenComplete(() =>
                        context.read<WishListBloc>().add(FetchwishListEvent()));
              },
              icon: const Icon(Icons.favorite),
              label: const Text('Add To Wishlist'))
        ],
      ),
    );
  }
}
