import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kicks_cart/application/business_logic/address/bloc/bloc/address_bloc.dart';

import 'package:kicks_cart/application/presentation/screens/indivual_product_checkout_screen/widgets/address_selector.dart';
import 'package:kicks_cart/application/presentation/screens/indivual_product_checkout_screen/widgets/individual_product_payment_method.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:kicks_cart/data/service/order/order_functions.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class IndividualProductCheckoutScreen extends StatefulWidget {
  final dynamic image;
  final int totalPrice;
  final String name;
  final String id;
  final String selectedSize;
  const IndividualProductCheckoutScreen(
      {super.key,
      required this.image,
      required this.totalPrice,
      required this.name,
      required this.id,
      required this.selectedSize});

  @override
  State<IndividualProductCheckoutScreen> createState() =>
      _IndividualProductCheckoutScreenState();
}

typedef AddressSelectedCallback = void Function(
  String selectedAddress,
);
typedef AddressIdCallback = void Function(String id);

class _IndividualProductCheckoutScreenState
    extends State<IndividualProductCheckoutScreen> {
  late Razorpay razorpay;

  void openCheckout(amount) async {
    int amt = widget.totalPrice + 10 * 100;
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
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 67),
                    const Text(
                      'Order Review',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                kHeight30,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(widget.name)
                  ],
                ),
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
                            const Text(
                              'Subtotal',
                              style: TextStyle(fontSize: 17),
                            ),
                            Text('₹${widget.totalPrice.toString()}')
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
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ('₹${widget.totalPrice + 10}').toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
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
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const IndividualPaymentMethodDialog();
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
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              child: const Text(
                                'Choose',
                                style: TextStyle(color: kGrey),
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AddressSelector(
                                        onAddressSelected: (selected) {
                                          setState(() {
                                            selectedAddress = selected;
                                          });
                                        },
                                        onAddressId: (selectedID) {
                                          setState(() {
                                            selectedAddressId = selectedID;
                                          });
                                        },
                                      );
                                    });
                              },
                            ),
                          ],
                        ),
                        Text(selectedAddress),
                        loading
                            ? const CircularProgressIndicator()
                            : MaterialButton(
                                onPressed: () async {
                                  if (selectedAddress.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
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
                                      openCheckout(widget.totalPrice);
                                    } else {
                                      await orderService
                                          .placeSingleProductOrder(
                                              selectedAddressId,
                                              widget.id,
                                              paymentMethod,
                                              context,
                                              widget.selectedSize)
                                          .whenComplete(
                                        () {
                                          setState(
                                            () {
                                              loading = false;
                                            },
                                          );
                                        },
                                      );
                                    }
                                  }
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
                                      style: TextStyle(
                                          color: kWhite, fontSize: 20),
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> placeTheOrder() async {
    setState(() {
      loading = true;
    });
    try {
      await orderService.placeSingleProductOrder(selectedAddressId, widget.id,
          paymentMethod, context, widget.selectedSize);
      setState(() {
        loading = false;
      });
      // Fetch cart after successful order placement
    } catch (e) {
      setState(() {
        loading = false;
      });
      // Handle error if order placement fails
    }
  }
}
