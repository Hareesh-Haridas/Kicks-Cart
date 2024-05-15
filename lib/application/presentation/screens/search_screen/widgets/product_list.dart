import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kicks_cart/Data/Service/favorites/favorites_functions.dart';

// import 'package:kicks_cart/Data/Service/products/config.dart';
// import 'package:kicks_cart/Domain/models/product/getProductModel/get_product_model.dart';
// import 'package:kicks_cart/Domain/models/product/product_model.dart';
import 'package:kicks_cart/application/business_logic/product/bloc/bloc/product_bloc.dart';
import 'package:kicks_cart/application/business_logic/wishlist/bloc/bloc/wish_list_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/product_detail_screen/product_detail_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:kicks_cart/data/service/favorites/favorites_functions.dart';
import 'package:kicks_cart/data/service/products/config.dart';
import 'package:kicks_cart/domain/models/product/getProductModel/get_product_model.dart';
import 'package:kicks_cart/domain/models/product/product_model.dart';
import 'package:kicks_cart/domain/models/wishlist/get_wishlist_model.dart';

class SearchProductLists extends StatefulWidget {
  final BuildContext context;
  const SearchProductLists({
    super.key,
    required this.context,
  });

  @override
  State<SearchProductLists> createState() => _SearchProductListsState();
}

late String productId;
List<String> homeProductId = [];

class _SearchProductListsState extends State<SearchProductLists> {
  late Future<void> _initialization;
  Set<String> wishlistIds = {};
  WishListService wishListService = WishListService();
  Future<bool> isFavorite(String productId) async {
    List<WishListModel> wishList = await wishListService.getFavorite();
    return wishList.any((item) => item.id == productId);
  }

  Future<void> initializeWishlistIds() async {
    List<WishListModel> wishList = await wishListService.getFavorite();
    setState(() {
      wishlistIds = wishList.map((item) => item.id).toSet();
    });
  }

  Future<void> updateWishlistStatus(String productId) async {
    setState(() {
      if (wishlistIds.contains(productId)) {
        wishlistIds.remove(productId);
      } else {
        wishlistIds.add(productId);
      }
    });
  }

  void getWishlistIds() async {
    List<WishListModel> wishList = await wishListService.getFavorite();
    setState(() {
      wishlistIds = wishList.map((item) => item.id).toSet();
    });
  }

  @override
  void initState() {
    super.initState();
    _initialization = initializeWishlistIds();
  }

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
                  for (int i = 0; i < products.length; i++) {
                    homeProductId.add(products[index].id);
                  }
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
                                    if (wishlistIds
                                        .contains(products[index].id)) {
                                      await wishListService
                                          .deleteFavorite(products[index].id,
                                              widget.context)
                                          .whenComplete(() => (context)
                                              .read<WishListBloc>()
                                              .add(FetchwishListEvent()));
                                      setState(() {
                                        wishlistIds.remove(products[index].id);
                                      });
                                    } else {
                                      await wishListService
                                          .addFavorite(products[index].id,
                                              widget.context)
                                          .whenComplete(() => (context)
                                              .read<WishListBloc>()
                                              .add(FetchwishListEvent()));
                                      setState(() {
                                        wishlistIds.add(products[index].id);
                                      });
                                    }
                                  },
                                  icon: Icon(
                                    wishlistIds.contains(products[index].id)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        wishlistIds.contains(products[index].id)
                                            ? kRed
                                            : null,
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
                                  fontWeight: FontWeight.w300, fontSize: 15),
                            ),
                            kHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                kWidth10,
                                Text(
                                  '₹${products[index].productPrice.toString()}',
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
        } else if (state is SearchProductsState) {
          List<GetProductModel>? searchResults = state.searchResults;
          if (searchResults == null || searchResults.isEmpty) {
            return const Text('No Search Results');
          } else {
            return Expanded(
                child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: searchResults.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, int index) {
                String imageFileName = searchResults[index].productImage[0];

                String imageUrl = '$productUrl/$imageFileName';

                productId = searchResults[index].id;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                              productId: searchResults[index].id)));
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
                                  await wishListService
                                      .addFavorite(searchResults[index].id,
                                          widget.context)
                                      .whenComplete(() => context
                                          .read<WishListBloc>()
                                          .add(FetchwishListEvent()));
                                },
                                icon: const Icon(
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
                            searchResults[index].productName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 15),
                          ),
                          kHeight10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              kWidth10,
                              Text(
                                '₹${searchResults[index].productPrice.toString()}',
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
            ));
          }
        } else if (state is ErrorSearchProductState) {
          return const Text('failed to search products');
        } else if (state is ErrorProductState) {
          return const Text('Failed to fetch products');
        } else {
          return const Text('unknown Error');
        }
      },
    );
  }
}
