import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Data/Service/cart/cart_functions.dart';
import 'package:kicks_cart/application/business%20logic/cart/bloc/cart_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/checkoutScreen/checkout_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class QuantityController extends StatefulWidget {
  final String id;
  final BuildContext context;
  const QuantityController({
    super.key,
    required this.id,
    required this.context,
  });

  @override
  State<QuantityController> createState() => _QuantityControllerState();
}

int counter = 1;

class _QuantityControllerState extends State<QuantityController> {
  void increment() {
    setState(() {
      counter++;
    });
  }

  void decrement() {
    setState(() {
      if (counter > 1) {
        counter--;
      } else {
        counter = 1;
      }
    });
  }

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
              onPressed: () {
                decrement();
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
            ' $counter',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(color: kWhite, border: Border.all()),
          child: IconButton(
              onPressed: () {
                increment();
              },
              icon: const Icon(
                Icons.add,
                color: kBlack,
              )),
        ),
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
                                    .whenComplete(() => widget.context
                                        .read<CartBloc>()
                                        .add(FetchCartEvent()));
                                Navigator.of(context).pop();
                              },
                              child: const Text('Delete'))
                        ],
                      ));
            },
            icon: Icon(
              Icons.delete,
              color: kRed,
            ),
            label: Text(
              'Remove',
              style: TextStyle(color: kBlack),
            )),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CheckoutScreen()));
          },
          child: Text(
            'Buy Now',
            style: TextStyle(color: kWhite),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: kGreen,
              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(2))),
        )
      ],
    );
  }
}
