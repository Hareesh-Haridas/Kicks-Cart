import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/indivual_product_checkout_screen/individual_product_checkout_screen.dart';
import 'package:kicks_cart/application/presentation/screens/product_detail_screen/widgets/filter_chip.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class BuyNowButton extends StatefulWidget {
  final int stock;
  final dynamic image;
  final String name;
  final int totalPrice;
  final String id;
  const BuyNowButton({
    super.key,
    required this.image,
    required this.name,
    required this.totalPrice,
    required this.id,
    required this.stock,
  });

  @override
  State<BuyNowButton> createState() => _BuyNowButtonState();
}

class _BuyNowButtonState extends State<BuyNowButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () {
              if (widget.stock < 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Sorry.Product is Out of Stock',
                      style: TextStyle(color: kWhite),
                    ),
                    backgroundColor: kRed,
                  ),
                );
              } else if (selectedSize.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'Please Select a Size',
                    style: TextStyle(color: kWhite),
                  ),
                  backgroundColor: kRed,
                ));
              } else {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => IndividualProductCheckoutScreen(
                          totalPrice: widget.totalPrice,
                          image: widget.image,
                          name: widget.name,
                          id: widget.id,
                          selectedSize: selectedSize,
                        )));
              }
            },
            color: Colors.green,
            textColor: kWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            height: 50,
            minWidth: 300,
            child: const Row(
              children: [
                kWidth30,
                Text(
                  'Buy Now',
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
