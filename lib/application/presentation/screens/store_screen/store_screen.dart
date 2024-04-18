import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/application/business_logic/category/bloc/bloc/category_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/category_detail_screen/category_detail_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:kicks_cart/domain/models/category_model/category_model.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhite,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            children: [
              kHeight30,
              const Row(
                children: [
                  kWidth30,
                  Text(
                    'Store',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              kHeight20,
              BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is LoadingCategoryState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedCategoryState) {
                    List<BrandModel>? categories = state.categories;
                    if (categories.isEmpty) {
                      return const Center(child: Text('Store is Empty'));
                    } else {
                      return Expanded(
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 8 / 6,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            double customHeight = 100.0;
                            double customWidth = 150.0;
                            return SizedBox(
                              height: customHeight,
                              width: customWidth,
                              child: GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CategoryDetailScreen(
                                                name: categories[index].name))),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color: kWhite,
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            spreadRadius: 1,
                                            blurRadius: 3)
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CircleAvatar(
                                                maxRadius: 23,
                                                backgroundImage: NetworkImage(
                                                    categories[index].image)),
                                            kWidth10,
                                            Text(
                                              categories[index].name,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  } else if (state is ErrorCategoryState) {
                    return Center(child: Text('Error ${state.error}'));
                  } else {
                    return const Center(child: Text("Unknown Error"));
                  }
                },
              )
            ],
          ),
        )));
  }
}
