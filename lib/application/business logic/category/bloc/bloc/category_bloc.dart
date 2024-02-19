import 'package:bloc/bloc.dart';
import 'package:kicks_cart/Data/Service/category/category_functions.dart';
import 'package:kicks_cart/Domain/models/categoryModel/category_model.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(LoadingCategoryState()) {
    on<FetchCategoriesEvent>((event, emit) async {
      try {
        List<BrandModel> categories = await getCategories();
        emit(LoadedCategoryState(categories));
      } catch (e) {
        emit(ErrorCategoryState('Error Fetching Categories $e'));
      }
    });
  }
}
