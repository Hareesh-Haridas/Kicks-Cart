// import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/data/service/address/adress_functions.dart';
// import 'package:kicks_cart/data/service/address/adress_functions.dart';
import 'package:kicks_cart/domain/models/address/get_address_model.dart';
// import 'package:kicks_cart/domain/models/address/get_address_model.dart';

// import 'package:kicks_cart/data/Service/address/adress_functions.dart';

// import 'package:kicks_cart/Domain/models/address/get_address_model.dart';

// import 'package:meta/meta.dart';

part 'address_event.dart';

part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(LoadingAddressState()) {
    on<AddressEvent>((event, emit) async {
      try {
        AddressService addressService = AddressService();

        List<GetAddressModel> address = await addressService.getAddress();

        emit(LoadedAddressState(address: address));
      } catch (e) {
        emit(ErrorAddressState(error: 'Error Fetching Addresses $e'));
      }
    });
  }
}
