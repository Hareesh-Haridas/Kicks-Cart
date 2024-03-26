import 'package:bloc/bloc.dart';


import 'package:kicks_cart/Data/Service/cart/cart_functions.dart';


import 'package:kicks_cart/Domain/models/cart/total_amount/total_amount_model.dart';


import 'package:meta/meta.dart';


part 'total_amount_event.dart';


part 'total_amount_state.dart';


class TotalAmountBloc extends Bloc<TotalAmountEvent, TotalAmountState> {

  TotalAmountBloc() : super(LoadingAmountState()) {

    on<FetchAmountEvent>((event, emit) async {

      try {

        int amount = await getTotalAmount();


        emit(LoadedAmountState(amount: amount));

      } catch (e) {

        emit(ErrorAmountState(error: 'Error Fetching Total amount $e'));

      }

    });

  }

}

