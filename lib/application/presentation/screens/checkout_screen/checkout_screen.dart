import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kicks_cart/application/business_logic/cart/bloc/cart_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/checkout_screen/widgets/address_picker.dart';
import 'package:kicks_cart/data/service/order/order_functions.dart';
import 'package:kicks_cart/application/business_logic/address/bloc/bloc/address_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/change_address_screen/change_address_screen.dart';
import 'package:kicks_cart/application/presentation/screens/checkout_screen/widgets/payment_method_dialog.dart';
import 'package:kicks_cart/application/presentation/screens/checkout_screen/widgets/product_detail_widget.dart';

import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:kicks_cart/domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckoutScreen extends StatefulWidget {
  final int subTotal;
  const CheckoutScreen({super.key, required this.subTotal});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

typedef AddressPickedCallback = void Function(String selectedAddress);
typedef AddressIdCallback = void Function(String id);

class _CheckoutScreenState extends State<CheckoutScreen> {
  late Razorpay razorpay;
  void openCheckout(amount) async {
    int amt = widget.subTotal + 10 * 100;
    var options = {
      'key': 'rzp_test_RxgDfildDUDYHa',
      'amount': amt,
      'name': 'Hareesh Haridas',
      'prefil': {
        'contact': '8590170626',
        'email': 'hareeshharidas2003@gmail.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint('Error : $e');
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(
        msg: "Payment Succesful${response.paymentId!}",
        toastLength: Toast.LENGTH_SHORT);
    await placeTheOrder();
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Fail${response.message!}",
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  final List<GetCartModel> passingProducts = [];
  String selectedAddressId = '';
  String selectedAddress = '';
  String paymentMethod = 'Cash on Delivery';
  OrderService orderService = OrderService();
  late AddressBloc addressBloc;
  String selectedOne = '';
  bool loading = false;
  @override
  void initState() {
    super.initState();
    addressBloc = context.read<AddressBloc>();
    addressBloc.add(FetchAddressEvent());
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    addressBloc = context.read<AddressBloc>();
    addressBloc.add(FetchAddressEvent());
  }

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
              BlocBuilder<AddressBloc, AddressState>(
                builder: (context, state) {
                  if (state is LoadingAddressState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LoadedAddressState) {
                    String? name;
                    int? phoneNumber;
                    String? otherDetails;
                    // List<GetAddressModel> address = state.address;
                    var address = state.address;
                    for (int i = 0; i < address.length; i++) {
                      if (selected == address[i].id) {
                        name = address[i].name;
                        phoneNumber = address[i].phoneNumber;
                        otherDetails = address[i].cityName;

                        break;
                      }
                    }
                    return Container(
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
                                const Text(
                                  'Subtotal',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text('₹ ${widget.subTotal.toString()}')
                              ],
                            ),
                            kHeight38,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Shipping Charge',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text('₹10')
                              ],
                            ),
                            kHeight38,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Order Total',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ('₹${widget.subTotal + 10}').toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                            kHeight30,
                            const Divider(),
                            kHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Payment Method',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const PaymentMethodDialog();
                                          }).then((selectedMethod) {
                                        if (selectedMethod != null) {
                                          setState(() {
                                            paymentMethod = selectedMethod;
                                          });
                                        }
                                      });
                                    },
                                    child: const Text(
                                      'Change',
                                      style: TextStyle(color: kGrey),
                                    ))
                              ],
                            ),
                            Row(
                              children: [Text(paymentMethod)],
                            ),
                            kHeight30,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Choose Shipping Address',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      // final newSelectedAddress = Navigator.of(
                                      //         context)
                                      //     .push<String>(MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const ChangeAddressScreen()));
                                      // setState(() {
                                      //   selected =
                                      //       newSelectedAddress.toString();
                                      // });
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AddressPicker(
                                              onAddressSelected: (selected) {
                                                setState(() {
                                                  selectedAddress = selected;
                                                });
                                              },
                                              onAddressCallback: (selected) {
                                                setState(() {
                                                  selectedAddressId = selected;
                                                });
                                              },
                                            );
                                          });
                                    },
                                    child: const Text(
                                      'Choose',
                                      style: TextStyle(color: kGrey),
                                    ))
                              ],
                            ),
                            // kHeight30,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedAddress,
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ],
                            ),

                            kHeight10,
                            loading
                                ? const CircularProgressIndicator()
                                : MaterialButton(
                                    onPressed: () async {
                                      if (selectedAddress.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Please Select Shipping Address',
                                              style: TextStyle(color: kWhite),
                                            ),
                                            backgroundColor: kRed,
                                          ),
                                        );
                                      } else {
                                        setState(() {
                                          loading = true;
                                        });
                                        if (paymentMethod == 'Online Payment') {
                                          openCheckout(widget.subTotal);
                                        } else {
                                          await orderService
                                              .placeorder(
                                            selectedAddressId,
                                            paymentMethod,
                                            context,
                                          )
                                              .whenComplete(
                                            () {
                                              setState(
                                                () {
                                                  loading = false;
                                                },
                                              );
                                            },
                                          ).whenComplete(() => context
                                                  .read<CartBloc>()
                                                  .add(FetchCartEvent()));
                                        }
                                      }
                                    },
                                    color: Colors.green,
                                    textColor: kWhite,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 50,
                                    minWidth: 300,
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        kWidth30,
                                        Text(
                                          'Buy Now',
                                          style: TextStyle(
                                              color: kWhite, fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    );
                  } else if (state is ErrorAddressState) {
                    return const Center(child: Text('Error Loading Addresses'));
                  } else {
                    return const Center(child: Text('unknown Error'));
                  }
                },
              )
            ],
          )),
        ),
      ),
    );
  }

  Future<void> placeTheOrder() async {
    setState(() {
      loading = true;
    });
    try {
      await orderService.placeorder(
        selectedAddressId,
        paymentMethod,
        context,
      );
      setState(() {
        loading = false;
      });
      // Fetch cart after successful order placement
      context.read<CartBloc>().add(FetchCartEvent());
    } catch (e) {
      setState(() {
        loading = false;
      });
      // Handle error if order placement fails
    }
  }
}
