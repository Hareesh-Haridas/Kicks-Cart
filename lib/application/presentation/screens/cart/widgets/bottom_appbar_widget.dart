import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/application/business_logic/cart/bloc/cart_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/checkout_screen/checkout_screen.dart';

class Bottomappbar extends StatefulWidget {
  final bool showTotalPrice;
  final int totalAmount;
  const Bottomappbar({
    super.key,
    required this.totalAmount,
    required this.showTotalPrice,
  });

  @override
  State<Bottomappbar> createState() => _BottomappbarState();
}

class _BottomappbarState extends State<Bottomappbar> {
  @override
  Widget build(BuildContext context) {
    return widget.showTotalPrice
        ? BottomAppBar(
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Amount: ${widget.totalAmount}'),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CheckoutScreen(
                                subTotal: widget.totalAmount,
                              )));
                    },
                    child: const Text('Place Order'),
                  )
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
 // bool showBottomAppbar = false;
  // late StreamSubscription cartSubscription;
  // @override
  // void initState() {
  //   super.initState();
  //   final cartBloc = context.read<CartBloc>();

  //   cartSubscription = cartBloc.stream.listen((state) {
  //     if (state is LoadingCartState) {
  //       setState(() {
  //         showBottomAppbar = false;
  //       });
  //     } else if (state is LoadedCartState) {
  //       setState(() {
  //         showBottomAppbar = state.cart.isNotEmpty;
  //       });
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   cartSubscription.cancel();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final cartBloc = context.read<CartBloc>();
  //   cartBloc.stream.listen((state) {
  //     if (state is LoadedCartState) {
  //       setState(() {
  //         showBottomAppbar = state.cart.isNotEmpty;
  //       });
  //     }
  //   });
  // }