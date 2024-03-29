import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Domain/models/cart/total_amount/total_amount_model.dart';
import 'package:kicks_cart/application/business%20logic/cart/bloc/cart_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/checkoutScreen/checkout_screen.dart';

class Bottomappbar extends StatefulWidget {
  final int totalAmount;
  const Bottomappbar({
    super.key,
    required this.totalAmount,
  });

  @override
  State<Bottomappbar> createState() => _BottomappbarState();
}

class _BottomappbarState extends State<Bottomappbar> {
  bool showBottomAppbar = false;
  @override
  void initState() {
    super.initState();
    final cartBloc = context.read<CartBloc>();
    cartBloc.stream.listen((state) {
      if (state is LoadedCartState) {
        setState(() {
          showBottomAppbar = state.cart.isNotEmpty;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final cartBloc = context.read<CartBloc>();
    cartBloc.stream.listen((state) {
      if (state is LoadedCartState) {
        setState(() {
          showBottomAppbar = state.cart.isNotEmpty;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('TOTAL AMOUNT-------${widget.totalAmount}');
    return showBottomAppbar
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
