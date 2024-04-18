// import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kicks_cart/Data/Service/category/category_functions.dart';

// import 'package:kicks_cart/Domain/models/categoryModel/category_model.dart';
import 'package:kicks_cart/domain/models/category_model/category_model.dart';

// import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(LoadingCategoryState()) {
    on<FetchCategoriesEvent>((event, emit) async {
      try {
        CategoryService categoryService = CategoryService();

        List<BrandModel> categories = await categoryService.getCategories();

        emit(LoadedCategoryState(categories));
      } catch (e) {
        emit(ErrorCategoryState('Error Fetching Categories $e'));
      }
    });
  }
}
