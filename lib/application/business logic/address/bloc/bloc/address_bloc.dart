import 'package:bloc/bloc.dart';


import 'package:kicks_cart/Data/Service/address/adress_functions.dart';


import 'package:kicks_cart/Domain/models/address/get_address_model.dart';


import 'package:meta/meta.dart';


part 'address_event.dart';


part 'address_state.dart';


class AddressBloc extends Bloc<AddressEvent, AddressState> {

  AddressBloc() : super(LoadingAddressState()) {

    on<AddressEvent>((event, emit) async {

      try {

        List<GetAddressModel> address = await getAddress();

        emit(LoadedAddressState(address: address));

      } catch (e) {
        emit(ErrorAddressState(error: 'Error Fetching Addresses $e'));
      }

    });

  }

}

