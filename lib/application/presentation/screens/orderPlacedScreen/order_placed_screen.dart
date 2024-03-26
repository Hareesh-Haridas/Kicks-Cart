import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/home_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:lottie/lottie.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({super.key});

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animations/order_placed.json',
                    fit: BoxFit.cover, height: 230, repeat: true),
              ],
            ),
            kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Order Placed!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 200,
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.green,
              textColor: kWhite,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              height: 50,
              minWidth: 300,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Back to Shopping',
                    style: TextStyle(color: kWhite, fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
