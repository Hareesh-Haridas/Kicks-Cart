import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Domain/models/categoryModel/category_model.dart';
import 'package:kicks_cart/application/business%20logic/category/bloc/bloc/category_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/carousel_slider.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/product_lists.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.token});
  final token;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late CategoryBloc categoryBloc;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    categoryBloc = context.read<CategoryBloc>();
    categoryBloc.add(FetchCategoriesEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categoryBloc = context.read<CategoryBloc>();
    categoryBloc.add(FetchCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //  kWidth20,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    child: Text(
                      "Good Day to Shopping",
                      style: TextStyle(color: kWhite),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: kWhite,
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        await logOut(context);
                      },
                      icon: Icon(
                        Icons.exit_to_app,
                        color: kWhite,
                      ))
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    child: Text(
                      "Welcome Hareesh Haridas",
                      style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              kHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 50,
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            kWidth30,
                            Icon(
                              Icons.search,
                              color: kGrey,
                            ),
                            kWidth10,
                            Text(
                              "Search in Store",
                              style: TextStyle(color: kGrey),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              kHeight30,
              const Row(
                children: [
                  kWidth30,
                  Text(
                    "Popular Brands",
                    style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              kHeight10,
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is LoadingCategoryState) {
                    return const CircularProgressIndicator();
                  } else if (state is LoadedCategoryState) {
                    List<BrandModel>? categories = state.categories;
                    if (categories.isEmpty) {
                      return const Text('No Categories Available');
                    } else {
                      return Container(
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: kWhite,
                                      ),
                                      child: Image.network(
                                        categories[index].image,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      categories[index].name,
                                      style: const TextStyle(color: kWhite),
                                    )
                                  ],
                                ),
                              );
                            }),
                      );
                    }
                  } else if (state is ErrorCategoryState) {
                    return Text('Error ${state.error}');
                  } else {
                    return Text('Unknown Error');
                  }
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width, height: 1000,
                //  height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
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
                      const ProductLists(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
