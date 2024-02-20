import 'package:bloc/bloc.dart';

import 'package:kicks_cart/Data/Service/products/product_functions.dart';


import 'package:kicks_cart/Domain/models/product/product_model.dart';


import 'package:meta/meta.dart';


part 'product_event.dart';


part 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {

  ProductBloc() : super(LoadingProductState()) {

    on<ProductEvent>((event, emit) async {

      try {

        List<ProductModel> products = await getProducts();


        emit(LoadededProductState(products));

      } catch (e) {

        emit(ErrorProductState('Error Fetching Categories $e'));

      }

    });

  }

}

