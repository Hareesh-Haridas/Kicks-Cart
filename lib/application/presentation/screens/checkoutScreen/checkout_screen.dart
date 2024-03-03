import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/checkoutScreen/widgets/product_detail_widget.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SafeArea(
              child: Column(
            children: [
              kHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const SizedBox(
                    width: 67,
                  ),
                  const Text(
                    'Order Review',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              kHeight30,
              const ProductDetailWidget(),
              kHeight30,
              Container(
                height: 550,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: kGrey),
                    borderRadius: BorderRadius.circular(13)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Column(
                    children: [
                      kHeight20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(fontSize: 17),
                          ),
                          Text('Rs.2000')
                        ],
                      ),
                      kHeight38,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping Fee',
                            style: TextStyle(fontSize: 17),
                          ),
                          Text('Rs.10')
                        ],
                      ),
                      kHeight38,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Order Total',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Rs.2010',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      kHeight30,
                      Divider(),
                      kHeight30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping Address',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Change',
                            style: TextStyle(color: kGrey),
                          )
                        ],
                      ),
                      kHeight30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hareesh Haridas',
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      kHeight30,
                      Row(
                        children: [
                          Icon(Icons.call),
                          Text(
                            '8590170626',
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                      kHeight30,
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Expanded(
                            child: Text(
                              'Velamparambil House Eroor Tripunithura',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                      kHeight30,
                      MaterialButton(
                        onPressed: () {
                          // Your onPressed logic here
                        },
                        color: Colors.green,
                        textColor: kWhite,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        minWidth: 300,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            kWidth30,
                            Text(
                              'Buy Now',
                              style: TextStyle(color: kWhite, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
