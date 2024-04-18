import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/category/category_functions.dart';
import 'package:kicks_cart/Data/Service/favorites/favorites_functions.dart';
import 'package:kicks_cart/Data/Service/products/config.dart';
// import 'package:kicks_cart/Domain/models/categoryModel/category_detail_model.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:kicks_cart/domain/models/category_model/category_detail_model.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String name;
  const CategoryDetailScreen({super.key, required this.name});

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  WishListService wishListService = WishListService();
  late Future<List<CategoryDetailModel>> categoryDetailFuture;
  CategoryService categoryService = CategoryService();
  @override
  void initState() {
    categoryDetailFuture = categoryService.getCategoryDetail(widget.name);
    super.initState();
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
              FutureBuilder(
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
                    return Expanded(
                      child: GridView.builder(
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
                                          await wishListService.addFavorite(
                                              product.id, context);
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
                          );
                        },
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
