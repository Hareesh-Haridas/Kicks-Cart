import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Data/Service/cart/cart_functions.dart';
import 'package:kicks_cart/application/business%20logic/cart/bloc/cart_bloc.dart';
import 'package:kicks_cart/application/business%20logic/total_amount/bloc/bloc/total_amount_bloc.dart';
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

class _QuantityControllerState extends State<QuantityController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 30,
          width: 30,
          decoration: BoxDecoration(color: kWhite, border: Border.all()),
          child: IconButton(
              onPressed: () async {
                if (widget.stock - 1 >= 1) {
                  await editQuantity(widget.stock - 1, widget.id, context)
                      .whenComplete(
                          () => context.read<CartBloc>().add(FetchCartEvent()))
                      .whenComplete(() => context
                          .read<TotalAmountBloc>()
                          .add(FetchAmountEvent()));
                }
              },
              icon: const Icon(
                Icons.minimize,
                color: kBlack,
              )),
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
          child: IconButton(
              onPressed: () async {
                await editQuantity(widget.stock + 1, widget.id, context)
                    .whenComplete(
                        () => context.read<CartBloc>().add(FetchCartEvent()))
                    .whenComplete(() => context
                        .read<TotalAmountBloc>()
                        .add(FetchAmountEvent()));
              },
              icon: const Icon(
                Icons.add,
                color: kBlack,
              )),
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
                                await deleteCart(widget.id, widget.context)
                                    .whenComplete(() => context
                                        .read<CartBloc>()
                                        .add(FetchCartEvent()));
                                Navigator.of(context).pop();
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
