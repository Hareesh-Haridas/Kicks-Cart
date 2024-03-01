part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class LoadingCartState extends CartState {}

class LoadedCartState extends CartState {
  final List<GetCartModel> cart;

  LoadedCartState({required this.cart});
}

class ErrorCartState extends CartState {
  final String error;

  ErrorCartState({required this.error});
}
