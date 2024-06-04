import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kicks_cart/Domain/models/categoryModel/category_model.dart';
import 'package:kicks_cart/application/business_logic/category/bloc/bloc/category_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/category_detail_screen/category_detail_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/domain/models/category_model/category_model.dart';
import 'package:transparent_image/transparent_image.dart';

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
          categories =
              categories.where((categories) => !categories.blocked).toList();
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
                                        name: categories![index].name,
                                        id: categories[index].id,
                                      )));
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kWhite,
                              ),
                              child: ClipOval(
                                child: FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: categories![index].image,
                                  fit: BoxFit.cover,
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
          return const Text('Unknown Error');
        }
      },
    );
  }
}
