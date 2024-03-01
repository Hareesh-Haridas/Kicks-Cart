import 'package:bloc/bloc.dart';
import 'package:kicks_cart/Data/Service/cart/cart_functions.dart';
import 'package:kicks_cart/Domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(LoadingCartState()) {
    on<FetchCartEvent>((event, emit) async {
      try {
        List<GetCartModel> cart = await getCart();
        emit(LoadedCartState(cart: cart));
      } catch (e) {
        emit(ErrorCartState(error: 'Error Fetching Categories $e'));
      }
    });
  }
}
