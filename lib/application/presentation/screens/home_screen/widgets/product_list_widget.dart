import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/home_screen/widgets/carousel_slider.dart';
import 'package:kicks_cart/application/presentation/screens/home_screen/widgets/product_lists.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ProductListWidget extends StatefulWidget {
  final BuildContext context;
  const ProductListWidget({
    super.key,
    required this.context,
  });

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1400,
      //  height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            kHeight10,
            // const CarouselBanner(),
            kHeight10,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Popular products",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            ProductLists(
              context: widget.context,
            ),
          ],
        ),
      ),
    );
  }
}
