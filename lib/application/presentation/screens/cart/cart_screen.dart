import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Data/Service/products/config.dart';
import 'package:kicks_cart/Domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';
import 'package:kicks_cart/application/business%20logic/cart/bloc/cart_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/ProductDetailScreen/product_detail_screen.dart';
import 'package:kicks_cart/application/presentation/screens/cart/widgets/bottom_appbar_widget.dart';
import 'package:kicks_cart/application/presentation/screens/cart/widgets/quantity_widget.dart';
import 'package:kicks_cart/application/presentation/screens/cart/widgets/text_widgets.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc cartBloc;
  int totalAmount = 0;
  @override
  void initState() {
    super.initState();
    cartBloc = context.read<CartBloc>();
    cartBloc.add(FetchCartEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    cartBloc = context.read<CartBloc>();
    cartBloc.add(FetchCartEvent());
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
              const MyCartText(),
              kHeight30,
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is LoadingCartState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is LoadedCartState) {
                    List<GetCartModel>? cart = state.cart;
                    if (cart.isEmpty) {
                      return const Center(
                        child: Text('Cart is Empty'),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: cart.length,
                          itemBuilder: (context, index) {
                            for (int i = 0; i <= cart.length; i++) {
                              totalAmount = totalAmount + cart[index].price;
                            }
                            String imageFileName = cart[index].image[0];
                            String imageUrl = '$productUrl/$imageFileName';
                            return GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                          productId: cart[index].id))),
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                height: 200,
                                width: 300,
                                decoration: BoxDecoration(
                                    border: Border.all(color: kGrey)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    children: [
                                      kHeight10,
                                      Row(
                                        children: [
                                          Container(
                                            height: 90,
                                            width: 80,
                                            decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: kGrey)),
                                            child: Image.network(
                                              imageUrl,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          kWidth30,
                                          SizedBox(
                                            height: 100,
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cart[index].name,
                                                  style: const TextStyle(
                                                      fontSize: 20),
                                                ),
                                                kHeight10,
                                                Text(
                                                  'Size: ${cart[index].size}',
                                                  style: const TextStyle(
                                                      fontSize: 15),
                                                ),
                                                kHeight10,
                                                Text(
                                                  'Rs.${cart[index].price * cart[index].stock}',
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 23),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      kHeight10,
                                      QuantityText(),
                                      SizedBox(height: 5),
                                      QuantityController(
                                        stock: cart[index].stock,
                                        id: cart[index].id,
                                        context: context,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  } else if (state is ErrorCartState) {
                    return Center(
                      child: Text('Error${state.error}'),
                    );
                  } else {
                    return const Center(child: Text('Unknown Error'));
                  }
                  // return Text('data');
                },
              ),
            ],
          ),
        )),
        bottomNavigationBar: Bottomappbar(
          totalAmount: totalAmount,
        ));
  }
}
