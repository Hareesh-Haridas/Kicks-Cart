import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kicks_cart/Data/Service/products/config.dart';
// import 'package:kicks_cart/Domain/models/order/get_order_model.dart';
import 'package:kicks_cart/application/business_logic/orders/bloc/bloc/order_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/order_detail_screen/order_detail_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:kicks_cart/data/service/order/order_functions.dart';
import 'package:kicks_cart/data/service/products/config.dart';
import 'package:kicks_cart/domain/models/order/get_order_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  late OrderBloc orderBloc;
  @override
  void initState() {
    super.initState();
    orderBloc = context.read<OrderBloc>();
    orderBloc.add(FetchOrderEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    orderBloc = context.read<OrderBloc>();
    orderBloc.add(FetchOrderEvent());
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
                child: BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    if (state is LoadingOrderState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is LoadedOrderState) {
                      List<GetOrderModel> orders = state.orders;

                      return ListView.separated(
                        separatorBuilder: (context, index) => kHeight10,
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          String imageFileName = orders[index].images[0];
                          String imageUrl = '$productUrl/$imageFileName';
                          return GestureDetector(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => OrderDetailScreen(
                                          id: orders[index].id,
                                          index: index,
                                        ))),
                            child: Container(
                              height: 160,
                              width: 100,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  children: [
                                    kHeight20,
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 90,
                                          width: 90,
                                          child: FadeInImage.memoryNetwork(
                                            fadeInDuration: const Duration(
                                                milliseconds: 500),
                                            placeholder: kTransparentImage,
                                            image: imageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        kWidth10,
                                        SizedBox(
                                          height: 130,
                                          width: 130,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(orders[index].name),
                                                ],
                                              ),
                                              kHeight10,
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '₹${orders[index].price.toString()}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  TextButton(
                                                      onPressed: () async {
                                                        if (orders[index]
                                                                .status ==
                                                            'cancelled') {
                                                          return;
                                                        } else {
                                                          await cancelOrder(
                                                                  orders[index]
                                                                      .id,
                                                                  context)
                                                              .whenComplete(
                                                                  () => context
                                                                      .read<
                                                                          OrderBloc>()
                                                                      .add(
                                                                          FetchOrderEvent()));
                                                        }
                                                      },
                                                      child: Text(
                                                        orders[index].status ==
                                                                'cancelled'
                                                            ? 'Cancelled'
                                                            : 'cancel',
                                                        style: const TextStyle(
                                                            color: kRed),
                                                      ))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                                color: kBlack,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Center(
                                              child: Text(
                                                orders[index].status,
                                                style: const TextStyle(
                                                    color: kWhite),
                                              ),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is ErrorOrderState) {
                      return const Center(child: Text('Error Fetching orders'));
                    } else {
                      return const Center(child: Text('Unknown Error occured'));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
