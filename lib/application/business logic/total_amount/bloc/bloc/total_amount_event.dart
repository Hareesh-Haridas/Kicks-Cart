part of 'total_amount_bloc.dart';


@immutable

sealed class TotalAmountEvent {}


class FetchAmountEvent extends TotalAmountEvent {}
