part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

class LoadingCartState extends CartState {}

class LoadedCartState extends CartState {
  final List<GetCartModel> cart;
  final int totalPrice;
  LoadedCartState(this.totalPrice, {required this.cart});
}

class ErrorCartState extends CartState {
  final String error;

  ErrorCartState({required this.error});
}
