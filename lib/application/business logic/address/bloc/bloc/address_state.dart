part of 'address_bloc.dart';


@immutable

sealed class AddressState {}


final class AddressInitial extends AddressState {}


class LoadingAddressState extends AddressState {}


class LoadedAddressState extends AddressState {

  final List<GetAddressModel> address;


  LoadedAddressState({required this.address});

}


class ErrorAddressState extends AddressState {

  final String error;


  ErrorAddressState({required this.error});

}

