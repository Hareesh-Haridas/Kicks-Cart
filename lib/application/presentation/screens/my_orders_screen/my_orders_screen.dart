import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            kHeight30,
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text(
                  'My Orders',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            kHeight50,
            Expanded(
                child: ListView.separated(
              separatorBuilder: (context, index) => kHeight10,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 140,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: kGrey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ))
          ],
        ),
      )),
    );
  }
}
