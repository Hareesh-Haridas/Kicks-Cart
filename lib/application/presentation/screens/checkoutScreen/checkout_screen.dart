import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Domain/models/address/get_address_model.dart';
import 'package:kicks_cart/application/business%20logic/address/bloc/bloc/address_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/changeAddressScreen/change_address_screen.dart';
import 'package:kicks_cart/application/presentation/screens/checkoutScreen/widgets/product_detail_widget.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late AddressBloc addressBloc;
  String selectedOne = '';
  @override
  void initState() {
    super.initState();
    addressBloc = context.read<AddressBloc>();
    addressBloc.add(FetchAddressEvent());
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
                    List<GetAddressModel> address = state.address;
                    for (int i = 0; i < address.length; i++) {
                      if (selected == address[i].id) {
                        name = address[i].name;
                        phoneNumber = address[i].phoneNumber;
                        otherDetails = address[i].cityName;
                        print('Name : $name');
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal',
                                  style: TextStyle(fontSize: 17),
                                ),
                                Text('₹2000')
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
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order Total',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '₹2010',
                                  style: TextStyle(
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
                                    onPressed: () {},
                                    child: const Text(
                                      'Change',
                                      style: TextStyle(color: kGrey),
                                    ))
                              ],
                            ),
                            Row(
                              children: [Text('Cash on Delivery')],
                            ),
                            kHeight30,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Shipping Address',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      final newSelectedAddress = Navigator.of(
                                              context)
                                          .push<String>(MaterialPageRoute(
                                              builder: (context) =>
                                                  const ChangeAddressScreen()));
                                      if (newSelectedAddress != null) {
                                        setState(() {
                                          selected =
                                              newSelectedAddress.toString();
                                        });
                                      }
                                    },
                                    child: const Text(
                                      'Change',
                                      style: TextStyle(color: kGrey),
                                    ))
                              ],
                            ),
                            kHeight30,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selected != null && selected.isNotEmpty
                                      ? name ?? ''
                                      : address[0].name,
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            kHeight30,
                            Row(
                              children: [
                                const Icon(Icons.call),
                                Text(
                                  selected != null && selected.isNotEmpty
                                      ? phoneNumber.toString()
                                      : address[0].phoneNumber.toString(),
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ],
                            ),
                            kHeight30,
                            Row(
                              children: [
                                const Icon(Icons.location_on_outlined),
                                Expanded(
                                  child: Text(
                                    selected.isNotEmpty
                                        ? otherDetails ?? ''
                                        : '${address[0].cityName},${address[0].streetName}',
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ),
                              ],
                            ),
                            kHeight10,
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
                                    style:
                                        TextStyle(color: kWhite, fontSize: 20),
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
}
