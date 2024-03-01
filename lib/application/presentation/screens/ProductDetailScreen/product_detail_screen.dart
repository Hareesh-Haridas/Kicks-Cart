import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/products/config.dart';
import 'package:kicks_cart/Data/Service/products/product_functions.dart';
import 'package:kicks_cart/Domain/models/product/getProductModel/get_product_model.dart';
import 'package:kicks_cart/Domain/models/product/product_model.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/add_to_cart_but_now_widget.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/buy_now_button.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/divider_widget.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/filter_chip.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/image_widget.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/product_details.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/Widgets/stock_indicator_wishlist_button.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

late Future<GetProductModel> productDetailFuture;
late GetProductModel fetchDetails;

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    productDetailFuture = fetchProductDetail(widget.productId);
    int index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: FutureBuilder(
        future: productDetailFuture,
        builder: (context, snapsot) {
          if (snapsot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapsot.hasError) {
            return Text('Error: ${snapsot.error}');
          } else {
            GetProductModel productModel = snapsot.data!;

            return SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    kHeight50,
                    ImageWidget(
                      image1: '$productUrl/${productModel.productImage[0]}',
                      image2: '$productUrl/${productModel.productImage[0]}',
                      image3: '$productUrl/${productModel.productImage[2]}',
                      image4: '$productUrl/${productModel.productImage[3]}',
                    ),
                    kHeight20,
                    ProductNameWidget(
                      name: productModel.productName,
                    ),
                    kHeight10,
                    const DividerWidget(),
                    ProductPriceWidget(
                      price: productModel.productPrice,
                    ),
                    kHeight10,
                    const DividerWidget(),
                    const ProductDescriptionWidget(),
                    kHeight10,
                    ProductDescriptionDetail(
                      description: productModel.productDescription,
                    ),
                    kHeight10,
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Divider(),
                    ),
                    SizeSelector(),
                    kHeight10,
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Divider(),
                    ),
                    StockIndicatorWishlistWidget(
                      stock: productModel.stock,
                    ),
                    const DividerWidget(),
                    AddToCartBuyNowWidgets(
                      id: productModel.id,
                    ),
                    kHeight10,
                    BuyNowButton(),
                    kHeight10,
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
