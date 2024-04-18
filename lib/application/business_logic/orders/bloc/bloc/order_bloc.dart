// import 'package:bloc/bloc.dart';


import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:kicks_cart/data/service/order/order_functions.dart';

import 'package:kicks_cart/domain/models/order/get_order_model.dart';


// import 'package:kicks_cart/Data/Service/order/order_functions.dart';


// import 'package:kicks_cart/Domain/models/order/get_order_model.dart';


// import 'package:meta/meta.dart';


part 'order_event.dart';


part 'order_state.dart';


class OrderBloc extends Bloc<OrderEvent, OrderState> {

  OrderBloc() : super(LoadingOrderState()) {

    on<FetchOrderEvent>((event, emit) async {

      try {

        OrderService orderService = OrderService();


        List<GetOrderModel> orders = await orderService.getOrders();


        emit(LoadedOrderState(orders: orders));

      } catch (e) {

        emit(ErrorOrderState(error: 'Error Fetching orders $e'));

      }

    });

  }

}

