import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Domain/models/categoryModel/category_model.dart';
import 'package:kicks_cart/application/business%20logic/category/bloc/bloc/category_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/CategoryDetailScreen/category_detail_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is LoadingCategoryState) {
          return const CircularProgressIndicator();
        } else if (state is LoadedCategoryState) {
          List<BrandModel>? categories = state.categories;
          if (categories.isEmpty) {
            return const Text('No Categories Available');
          } else {
            return SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CategoryDetailScreen(
                                      name: categories[index].name)));
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kWhite,
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  categories[index].image,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    print("Error loading image: $error");
                                    print("Stack trace: $stackTrace");
                                    return const Text('No Image');
                                  },
                                ),
                              ),
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
    );
  }
}
