part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class FetchCartEvent extends CartEvent {}
