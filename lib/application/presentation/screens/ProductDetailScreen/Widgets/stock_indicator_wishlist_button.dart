import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class StockIndicatorWishlistWidget extends StatefulWidget {
  final int stock;
  const StockIndicatorWishlistWidget({
    super.key,
    required this.stock,
  });

  @override
  State<StockIndicatorWishlistWidget> createState() =>
      _StockIndicatorWishlistWidgetState();
}

class _StockIndicatorWishlistWidgetState
    extends State<StockIndicatorWishlistWidget> {
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
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              label: Text('Add To Wishlist'))
        ],
      ),
    );
  }
}
