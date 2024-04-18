// import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:kicks_cart/Data/Service/products/product_functions.dart';


import 'package:kicks_cart/Domain/models/product/getProductModel/get_product_model.dart';


import 'package:kicks_cart/Domain/models/product/product_model.dart';


// import 'package:meta/meta.dart';


part 'product_event.dart';


part 'product_state.dart';


class ProductBloc extends Bloc<ProductEvent, ProductState> {

  ProductBloc() : super(LoadingProductState()) {

    on<ProductEvent>((event, emit) async {

      try {

        ProductService productService = ProductService();


        List<ProductModel> products = await productService.getProducts();


        emit(LoadededProductState(products));

      } catch (e) {

        emit(ErrorProductState('Error Fetching Categories $e'));

      }

    });


    on<SearchProductsEvent>((event, emit) async {

      try {

        ProductService productService = ProductService();


        List<GetProductModel> searchResults =

            await productService.getSearchedProducts(event.query);


        emit(SearchProductsState(searchResults: searchResults));

      } catch (e) {

        emit(ErrorProductState('Error Searching Products $e'));

      }

    });

  }

}

