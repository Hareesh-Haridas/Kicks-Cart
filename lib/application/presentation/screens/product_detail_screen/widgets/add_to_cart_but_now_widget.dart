import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/cart/cart_functions.dart';
import 'package:kicks_cart/application/presentation/screens/product_detail_screen/widgets/filter_chip.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class AddToCartBuyNowWidgets extends StatefulWidget {
  final String id;
  const AddToCartBuyNowWidgets({
    super.key,
    required this.id,
  });

  @override
  State<AddToCartBuyNowWidgets> createState() => _AddToCartBuyNowWidgetsState();
}

class _AddToCartBuyNowWidgetsState extends State<AddToCartBuyNowWidgets> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? const CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });
                    CartService cartService = CartService();
                    await cartService
                        .addToCart(widget.id, context, selectedSize)
                        .whenComplete(() {
                      setState(() {
                        loading = false;
                      });
                    });
                  },
                  color: kBlueGrey,
                  textColor: kWhite,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  height: 50,
                  minWidth: 300,
                  child: const Row(
                    children: [
                      kWidth30,
                      Icon(
                        Icons.add_shopping_cart_outlined,
                        color: kWhite,
                      ),
                      kWidth10,
                      Text(
                        'Add to Cart',
                        style: TextStyle(color: kWhite, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
