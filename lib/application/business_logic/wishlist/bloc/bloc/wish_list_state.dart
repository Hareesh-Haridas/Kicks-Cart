part of 'wish_list_bloc.dart';


@immutable

sealed class WishListState {}


final class WishListInitial extends WishListState {}


class LoadingWishListState extends WishListState {}


class LoadedWishListState extends WishListState {

  final List<WishListModel> wishList;


  LoadedWishListState({required this.wishList});

}


class ErrorWishListState extends WishListState {

  final String error;


  ErrorWishListState({required this.error});

}

