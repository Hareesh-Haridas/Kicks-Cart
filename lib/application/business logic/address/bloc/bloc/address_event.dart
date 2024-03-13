part of 'address_bloc.dart';


@immutable

sealed class AddressEvent {}


class FetchAddressEvent extends AddressEvent {}
