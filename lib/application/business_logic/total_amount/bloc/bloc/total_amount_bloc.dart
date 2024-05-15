// import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:kicks_cart/data/service/cart/cart_functions.dart';


// import 'package:kicks_cart/Data/Service/cart/cart_functions.dart';


// import 'package:meta/meta.dart';


part 'total_amount_event.dart';


part 'total_amount_state.dart';


class TotalAmountBloc extends Bloc<TotalAmountEvent, TotalAmountState> {

  TotalAmountBloc() : super(LoadingAmountState()) {

    on<FetchAmountEvent>((event, emit) async {

      try {

        CartService cartService = CartService();


        int amount = await cartService.getTotalAmount();


        emit(LoadedAmountState(amount: amount));

      } catch (e) {

        emit(ErrorAmountState(error: 'Error Fetching Total amount $e'));

      }

    });

  }

}

