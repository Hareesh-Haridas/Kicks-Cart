import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/order_placed_screen/widgets/address_details_widget.dart';

import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:kicks_cart/data/service/order/order_functions.dart';
import 'package:kicks_cart/data/service/products/config.dart';
import 'package:kicks_cart/domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';
import 'package:kicks_cart/domain/models/order/get_order_model.dart';
import 'package:lottie/lottie.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({
    super.key,
  });

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {
  OrderService orderService = OrderService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: FutureBuilder<List<GetOrderModel>>(
          future: orderService.getOrderDetails(orderId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<GetOrderModel> orders = snapshot.data!.cast<GetOrderModel>();

              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset('assets/animations/order_placed.json',
                            fit: BoxFit.cover, height: 230, repeat: false),
                      ],
                    ),
                    kHeight20,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Order Placed!',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                        setState(() {
                          orderId = '';
                        });
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
                          Text(
                            'Back to Shopping',
                            style: TextStyle(color: kWhite, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    kHeight30,
                    const Row(
                      children: [
                        Text(
                          'This order will be shipped to:',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 15),
                        ),
                      ],
                    ),
                    kHeight10,
                    AddressDetails(
                      address: orders[0].addressName,
                      cityName: orders[0].cityName,
                      phoneNumber: orders[0].phoneNumber,
                    ),
                    kHeight10,
                    const Row(
                      children: [
                        Text(
                          'Payment Method',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    kHeight10,
                    const Row(
                      children: [Text('Cash on delivery')],
                    ),
                    kHeight10,
                    const Row(
                      children: [
                        Text(
                          'Order Summary',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ],
                    ),
                    kHeight10,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: orders.length == 1
                          ? orders.length
                          : orders.length - 1,
                      itemBuilder: (context, index) {
                        print('Order length: ${orders.length}');
                        String imageFileName = orders[index].images[0];
                        String imageUrl = '$productUrl/$imageFileName';

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: kBlack)),
                            height: 150,
                            width: 330,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      height: 80,
                                      width: 100,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Name: ${orders[index].name}'),
                                          kHeight10,
                                          Text(
                                              'Price: ₹ ${orders[index].price}'),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Text('₹ ${orders[index].price}'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
