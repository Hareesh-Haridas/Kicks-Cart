part of 'category_bloc.dart';

@immutable
sealed class CategoryEvent {}

class FetchCategoriesEvent extends CategoryEvent {}
