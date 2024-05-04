// import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kicks_cart/data/Service/cart/cart_functions.dart';

import 'package:kicks_cart/domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';

// import 'package:kicks_cart/Domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';

// import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(LoadingCartState()) {
    on<FetchCartEvent>((event, emit) async {
      try {
        CartService cartService = CartService();

        // emit(LoadingCartState());

        List<GetCartModel> cart = await cartService.getCart();
        int totalPrice = await cartService.getTotalAmount();
        emit(LoadedCartState(cart: cart, totalPrice));
      } catch (e) {
        emit(ErrorCartState(error: 'Error Fetching Categories $e'));
      }
    });
  }
}
