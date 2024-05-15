import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/data/Service/cart/cart_functions.dart';
import 'package:kicks_cart/application/business_logic/cart/bloc/cart_bloc.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class QuantityController extends StatefulWidget {
  final int stock;
  final String id;
  final BuildContext context;

  const QuantityController({
    super.key,
    required this.id,
    required this.context,
    required this.stock,
  });

  @override
  State<QuantityController> createState() => _QuantityControllerState();
}

CartService cartService = CartService();

class _QuantityControllerState extends State<QuantityController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(color: kWhite, border: Border.all()),
          child: Center(
            child: Transform.translate(
              offset: const Offset(-4.0, -12.0),
              child: IconButton(
                onPressed: () async {
                  if (widget.stock - 1 >= 1) {
                    await cartService
                        .editQuantity(widget.stock - 1, widget.id, context)
                        .whenComplete(() =>
                            context.read<CartBloc>().add(FetchCartEvent()));
                  }
                },
                icon: const Icon(
                  Icons.minimize,
                  color: kBlack,
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 30,
          width: 40,
          decoration: BoxDecoration(border: Border.all()),
          child: Text(
            ' ${widget.stock}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(color: kWhite, border: Border.all()),
          child: Center(
            child: Transform.translate(
              offset: const Offset(-4.0, -6.0),
              child: IconButton(
                  onPressed: () async {
                    await cartService
                        .editQuantity(widget.stock + 1, widget.id, context)
                        .whenComplete(() =>
                            context.read<CartBloc>().add(FetchCartEvent()));
                  },
                  icon: const Icon(
                    Icons.add,
                    color: kBlack,
                  )),
            ),
          ),
        ),
        kWidth100,
        TextButton.icon(
            onPressed: () async {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('Delete From Cart'),
                        content: const Text('Are You Sure You Want to Delete?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () async {
                                CartService cartService = CartService();
                                await cartService
                                    .deleteCart(widget.id, widget.context)
                                    .whenComplete(() => context
                                        .read<CartBloc>()
                                        .add(FetchCartEvent()));
                                if (context.mounted) {
                                  Navigator.of(context).pop();
                                }
                              },
                              child: const Text('Delete'))
                        ],
                      ));
            },
            icon: const Icon(
              Icons.delete,
              color: kRed,
            ),
            label: const Text(
              'Remove',
              style: TextStyle(color: kBlack),
            )),
      ],
    );
  }
}
