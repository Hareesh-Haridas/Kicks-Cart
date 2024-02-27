import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/products/product_functions.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/add_to_cart_but_now_widget.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/divider_widget.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/image_widget.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/product_details.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/stock_indicator_wishlist_button.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  final String name;
  final int price;
  final String description;
  final int stock;
  final String id;
  const ProductDetailScreen(
      {super.key,
      required this.name,
      required this.price,
      required this.description,
      required this.stock,
      required this.id});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  // @override
  // void initState() async {
  //   super.initState();
  // await fetchProductDetail(id, context)}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            kHeight50,
            const ImageWidget(),
            kHeight20,
            ProductNameWidget(
              productName: widget.name,
            ),
            kHeight10,
            const DividerWidget(),
            ProductPriceWidget(productPrice: widget.price),
            kHeight10,
            const DividerWidget(),
            const ProductDescriptionWidget(),
            kHeight10,
            ProductDescriptionDetail(productDescription: widget.description),
            kHeight10,
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Divider(),
            ),
            StockIndicatorWishlistWidget(),
            DividerWidget(),
            AddToCartBuyNowWidgets()
          ],
        )),
      ),
    );
  }
}
