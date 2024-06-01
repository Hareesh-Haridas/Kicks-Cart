import 'package:flutter/material.dart';

import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:kicks_cart/data/service/order/order_functions.dart';
import 'package:kicks_cart/data/service/products/config.dart';
import 'package:kicks_cart/domain/models/order/get_order_model.dart';
// import 'package:kicks_cart/domain/models/order/get_order_model.dart';
import 'package:intl/intl.dart';

class OrderDetailScreen extends StatefulWidget {
  final int index;
  final String id;
  const OrderDetailScreen({super.key, required this.id, required this.index});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  OrderService orderService = OrderService();

  @override
  void initState() {
    super.initState();
  }

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
              FutureBuilder(
                future: orderService.getOrderDetails(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<GetOrderModel> orders =
                        snapshot.data!.cast<GetOrderModel>();

                    return Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.arrow_back)),
                              const Text(
                                'Order Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              kWidth10,
                              Text(
                                  'Current Status: ${orders[widget.index].status}')
                            ],
                          ),
                          kHeight30,
                          Flexible(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => kHeight10,
                              itemCount: orders.length - 1,
                              itemBuilder: (context, index) {
                                String deliveryDateString =
                                    orders[index].deliveryDate;
                                DateTime? deliveryDate;
                                String formattedDeliveryDate = '';
                                try {
                                  deliveryDate =
                                      DateTime.parse(deliveryDateString);
                                  formattedDeliveryDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(deliveryDate);
                                } catch (e) {
                                  debugPrint(
                                      'Invalid date format: $deliveryDateString');
                                }

                                String imageFileName =
                                    orders[index].images.isNotEmpty
                                        ? orders[index].images[0]
                                        : '';
                                String imageUrl = '$productUrl/$imageFileName';

                                return Container(
                                  height: 299,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kGrey),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[300]!,
                                        offset: const Offset(5.0, 5.0),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ),
                                      const BoxShadow(
                                          color: kWhite,
                                          offset: Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0)
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              orders[index].name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 90,
                                              width: 90,
                                              child: imageFileName.isNotEmpty
                                                  ? Image.network(
                                                      imageUrl,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : const SizedBox.shrink(),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    orders[index].description))
                                          ],
                                        ),
                                        kHeight10,
                                        Row(
                                          children: [
                                            Text(
                                                'Brand: ${orders[index].brand}')
                                          ],
                                        ),
                                        kHeight10,
                                        Row(
                                          children: [
                                            Text('Size: ${orders[index].size}'),
                                          ],
                                        ),
                                        kHeight10,
                                        Row(
                                          children: [
                                            Text(
                                                'Price: ₹${orders[index].price.toString()}'),
                                          ],
                                        ),
                                        kHeight10,
                                        Row(
                                          children: [
                                            Text(
                                                'Quantity: ${orders[index].quantity}')
                                          ],
                                        ),
                                        kHeight10,
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  'Address: ${orders[index].addressName} | ${orders[index].cityName}| PhNo:${orders[index].phoneNumber} '),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                'Delivery Date: $formattedDeliveryDate')
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
