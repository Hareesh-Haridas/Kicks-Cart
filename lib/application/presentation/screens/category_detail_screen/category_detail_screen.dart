import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/application/business_logic/wishlist/bloc/bloc/wish_list_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/product_detail_screen/product_detail_screen.dart';
// import 'package:kicks_cart/Data/Service/category/category_functions.dart';
// import 'package:kicks_cart/Data/Service/favorites/favorites_functions.dart';
// import 'package:kicks_cart/Data/Service/products/config.dart';
// import 'package:kicks_cart/Domain/models/categoryModel/category_detail_model.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:kicks_cart/data/service/category/category_functions.dart';
import 'package:kicks_cart/data/service/favorites/favorites_functions.dart';
import 'package:kicks_cart/data/service/products/config.dart';
import 'package:kicks_cart/domain/models/category_model/category_detail_model.dart';
import 'package:kicks_cart/domain/models/wishlist/get_wishlist_model.dart';
import 'package:transparent_image/transparent_image.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String name;
  final String id;
  const CategoryDetailScreen({super.key, required this.name, required this.id});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  late Future<void> _initialization;
  Set<String> wishlistIds = {};
  WishListService wishListService = WishListService();
  late Future<List<CategoryDetailModel>> categoryDetailFuture;
  CategoryService categoryService = CategoryService();
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
    categoryDetailFuture = categoryService.getCategoryDetail(widget.name);
    super.initState();
    _initialization = initializeWishlistIds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              kHeight38,
              Row(
                children: [
                  kWidth20,
                  Text(
                    widget.name,
                    style: const TextStyle(
                        fontSize: 27, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              kHeight38,
              Expanded(
                child: FutureBuilder(
                  future: categoryDetailFuture,
                  builder: (context,
                      AsyncSnapshot<List<CategoryDetailModel>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No Products Available"));
                    } else {
                      return GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (_, int index) {
                          CategoryDetailModel product = snapshot.data![index];
                          String imageFileName = product.images[0];

                          String imageUrl = '$productUrl/$imageFileName';
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                          productId: product.id))),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                height: 300,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            // await wishListService.addFavorite(
                                            //     product.id, context);
                                            if (wishlistIds
                                                .contains(product.id)) {
                                              await wishListService
                                                  .deleteFavorite(
                                                      product.id, context)
                                                  .whenComplete(() => (context)
                                                      .read<WishListBloc>()
                                                      .add(
                                                          FetchwishListEvent()));
                                              setState(() {
                                                wishlistIds.remove(product.id);
                                              });
                                            } else {
                                              await wishListService
                                                  .addFavorite(
                                                      product.id, context)
                                                  .whenComplete(() => (context)
                                                      .read<WishListBloc>()
                                                      .add(
                                                          FetchwishListEvent()));
                                              setState(() {
                                                wishlistIds.add(product.id);
                                              });
                                            }
                                          },
                                          icon: Icon(
                                            wishlistIds.contains(product.id)
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color:
                                                wishlistIds.contains(product.id)
                                                    ? kRed
                                                    : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                    kHeight10,
                                    FadeInImage.memoryNetwork(
                                      fadeInDuration:
                                          const Duration(milliseconds: 1000),
                                      placeholder: kTransparentImage,
                                      image: imageUrl,
                                      fit: BoxFit.cover,
                                      height: 90,
                                      width: 150,
                                    ),
                                    Expanded(
                                      child: Text(
                                        product.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15),
                                      ),
                                    ),
                                    kHeight10,
                                    kWidth10,
                                    Text(
                                      '₹${product.price.toString()}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
              // BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
              //   builder: (context, state) {
              //     if (state is LoadingCategoryDetailState) {
              //       return Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     } else if (state is LoadedCategoryDetailState) {
              //       List<CategoryDetailModel> categories = state.categories;

              //       return Expanded(
              //         child: GridView.builder(
              //           physics: const AlwaysScrollableScrollPhysics(),
              //           scrollDirection: Axis.vertical,
              //           shrinkWrap: true,
              //           itemCount: categories.length,
              //           gridDelegate:
              //               const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             childAspectRatio: 0.75,
              //           ),
              //           itemBuilder: (context, index) {
              //             String imageFileName = categories[index].images[0];

              //             String imageUrl = '$productUrl/$imageFileName';
              //             return Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                     border: Border.all(),
              //                     borderRadius: BorderRadius.circular(10)),
              //                 height: 300,
              //                 child: Column(
              //                   children: [
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.end,
              //                       children: [
              //                         IconButton(
              //                           onPressed: () async {
              //                             await wishListService.addFavorite(
              //                                 categories[index].id, context);
              //                           },
              //                           icon: const Icon(
              //                             Icons.favorite_outline,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                     kHeight10,
              //                     Image.network(
              //                       imageUrl,
              //                       fit: BoxFit.cover,
              //                       height: 90,
              //                       width: 150,
              //                     ),
              //                     Expanded(
              //                       child: Text(
              //                         categories[index].name,
              //                         style: const TextStyle(
              //                             fontWeight: FontWeight.w300,
              //                             fontSize: 15),
              //                       ),
              //                     ),
              //                     kHeight10,
              //                     kWidth10,
              //                     Text(
              //                       '₹${categories[index].price.toString()}',
              //                       style: const TextStyle(
              //                         fontWeight: FontWeight.bold,
              //                       ),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       );
              //     } else if (state is ErrorCategoryDetailState) {
              //       print('Entered bloc');
              //       return Center(
              //         child: Text(state.error),
              //       );
              //     } else {
              //       return Center(
              //         child: Text('Unknown Error'),
              //       );
              //     }
              //   },
              // )
            ],
          ),
        ),
      ),
    );
  }
}
