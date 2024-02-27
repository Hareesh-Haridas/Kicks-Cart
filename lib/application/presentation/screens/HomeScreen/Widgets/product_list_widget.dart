import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/products/product_functions.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/carousel_slider.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/product_lists.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/product_detail_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ProductListWidget extends StatefulWidget {
  final BuildContext context;
  ProductListWidget({
    super.key,
    required this.context,
  });

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

late String detailName;
late int detailPrice;
late String detailDescription;
late int detailStock;
late String detailId;

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, height: 1000,
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
            CarouselBanner(),
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
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View all",
                      style: TextStyle(
                        color: kGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
                // onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => ProductDetailScreen(
                //           description: detailDescription,
                //           name: detailName,
                //           price: detailPrice,
                //           stock: detailStock,
                //           id: detailId,
                //         ))),
                onTap: () async {
                  await fetchProductDetail(detailId, widget.context);
                },
                child: ProductLists()),
          ],
        ),
      ),
    );
  }
}
