import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Domain/models/address/get_address_model.dart';
import 'package:kicks_cart/application/business_logic/address/bloc/bloc/address_bloc.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({super.key});

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

String selected = '2323';

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  late AddressBloc addressBloc;
  int? slectedAddress;
  @override
  void initState() {
    super.initState();
    addressBloc = context.read<AddressBloc>();
    addressBloc.add(FetchAddressEvent());
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
            kHeight38,
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Text(
                  'Change Shipping Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            kHeight38,
            BlocBuilder<AddressBloc, AddressState>(
              builder: (context, state) {
                if (state is LoadingAddressState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is LoadedAddressState) {
                  List<GetAddressModel> address = state.address;
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => kHeight10,
                      shrinkWrap: true,
                      itemCount: address.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Radio(
                                value: index,
                                groupValue: slectedAddress,
                                onChanged: (int? value) {
                                  setState(() {
                                    slectedAddress = value;
                                    selected = address[index].id;
                                  });
                                }),
                            Container(
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(border: Border.all()),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        kWidth30,
                                        Text(address[index].name)
                                      ],
                                    ),
                                    kHeight10,
                                    Row(
                                      children: [
                                        kWidth30,
                                        Text(address[index]
                                            .phoneNumber
                                            .toString())
                                      ],
                                    ),
                                    kHeight10,
                                    Row(
                                      children: [
                                        kWidth30,
                                        Text(address[index].cityName)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                } else if (state is ErrorAddressState) {
                  return const Center(child: Text('Error Loading Address'));
                } else {
                  return const Center(child: Text('Unknown Error'));
                }
              },
            ),
            MaterialButton(
              onPressed: () {
                if (slectedAddress != null) {
                  Navigator.of(context).pop(selected);
                  context.read<AddressBloc>().add(FetchAddressEvent());
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
                  Text(
                    'Ship to this Address',
                    style: TextStyle(color: kWhite, fontSize: 20),
                  ),
                  kHeight10
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
