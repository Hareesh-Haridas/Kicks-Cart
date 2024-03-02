import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Data/Service/favorites/favorites_functions.dart';
import 'package:kicks_cart/Data/Service/products/config.dart';
import 'package:kicks_cart/Domain/models/product/product_model.dart';
import 'package:kicks_cart/application/business%20logic/product/bloc/bloc/product_bloc.dart';
import 'package:kicks_cart/application/business%20logic/wishlist/bloc/bloc/wish_list_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/product_list_widget.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/product_detail_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ProductLists extends StatefulWidget {
  final BuildContext context;
  const ProductLists({
    super.key,
    required this.context,
  });

  @override
  State<ProductLists> createState() => _ProductListsState();
}

late String productId;

class _ProductListsState extends State<ProductLists> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is LoadingProductState) {
          return const CircularProgressIndicator();
        } else if (state is LoadededProductState) {
          List<ProductModel>? products = state.products;
          if (products.isEmpty) {
            return const Text('No products Available');
          } else {
            return Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (_, int index) {
                  String imageFileName = products[index].productImage[0];

                  String imageUrl = '$productUrl/$imageFileName';

                  productId = products[index].id;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                                productId: products[index].id)));
                      },
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[300]!,
                              offset: const Offset(5.0, 5.0),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ),
                            const BoxShadow(
                                color: kWhite,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0)
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    await addFavorite(
                                            products[index].id, widget.context)
                                        .whenComplete(() => context
                                            .read<WishListBloc>()
                                            .add(FetchwishListEvent()));
                                  },
                                  icon: Icon(
                                    Icons.favorite_outline,
                                  ),
                                ),
                              ],
                            ),
                            kHeight10,
                            Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              height: 90,
                              width: 150,
                            ),
                            Text(
                              products[index].productName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 18),
                            ),
                            kHeight10,
                            Row(
                              children: [
                                kWidth10,
                                Text(
                                  products[index].productPrice.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        } else if (state is ErrorProductState) {
          return Text('Error ${state.error}');
        } else {
          return const Text('Unknown Error');
        }
      },
    );
  }
}

List<String> extractFilenames(List<dynamic> productImageList) {
  const prefixToRemove = 'http://192.168.137.1:3000/addProduct/';
  return productImageList
      .map<String>((url) => url.toString().replaceAll(prefixToRemove, ''))
      .toList();
}
