part of 'order_bloc.dart';


@immutable

sealed class OrderState {}


final class OrderInitial extends OrderState {}


class LoadingOrderState extends OrderState {}


class LoadedOrderState extends OrderState {

  final List<GetOrderModel> orders;


  LoadedOrderState({required this.orders});

}


class ErrorOrderState extends OrderState {

  final String error;


  ErrorOrderState({required this.error});

}

