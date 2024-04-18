// import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:kicks_cart/Data/Service/favorites/favorites_functions.dart';


import 'package:kicks_cart/Domain/models/wishlist/get_wishlist_model.dart';


// import 'package:meta/meta.dart';


part 'wish_list_event.dart';


part 'wish_list_state.dart';


class WishListBloc extends Bloc<WishListEvent, WishListState> {

  WishListBloc() : super(LoadingWishListState()) {

    on<FetchwishListEvent>((event, emit) async {

      try {

        WishListService wishListService = WishListService();


        List<WishListModel> wishList = await wishListService.getFavorite();


        emit(LoadedWishListState(wishList: wishList));

      } catch (e) {

        emit(ErrorWishListState(error: 'Error Fetching WishList $e'));

      }

    });

  }

}

