part of 'total_amount_bloc.dart';


@immutable

sealed class TotalAmountState {}


final class TotalAmountInitial extends TotalAmountState {}


class LoadingAmountState extends TotalAmountState {}


class LoadedAmountState extends TotalAmountState {

  final int amount;


  LoadedAmountState({required this.amount});

}


class ErrorAmountState extends TotalAmountState {

  final String error;


  ErrorAmountState({required this.error});

}

