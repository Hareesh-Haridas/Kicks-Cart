part of 'product_bloc.dart';


@immutable

sealed class ProductState {}


final class ProductInitial extends ProductState {}


class LoadingProductState extends ProductState {}


class LoadededProductState extends ProductState {

  final List<ProductModel> products;


  LoadededProductState(this.products);

}


class ErrorProductState extends ProductState {

  final String error;


  ErrorProductState(this.error);

}
