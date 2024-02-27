import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class StockIndicatorWishlistWidget extends StatelessWidget {
  const StockIndicatorWishlistWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'In Stock',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: kGreen),
          ),
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.favorite),
              label: Text('Add To Wishlist'))
        ],
      ),
    );
  }
}
