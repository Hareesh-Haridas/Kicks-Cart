import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/data/Service/address/adress_functions.dart';
import 'package:kicks_cart/Domain/models/address/get_address_model.dart';
import 'package:kicks_cart/application/business_logic/address/bloc/bloc/address_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/edit_address_screen/edit_address_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({
    super.key,
  });

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if (state is LoadingAddressState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedAddressState) {
          List<GetAddressModel>? address = state.address;
          if (address.isEmpty) {
            return const Center(child: Text('No Addresses Available'));
          } else {
            return Expanded(
              child: ListView.builder(
                  itemCount: address.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 160,
                          width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      address[index].name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        'Ph No: ${address[index].phoneNumber.toString()}'),
                                  ],
                                ),
                                kHeight10,
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                            '${address[index].streetName}|Postal Code: ${address[index].pinCode}|${address[index].cityName}|${address[index].countryName}')),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertDialog(
                                                    title: const Text(
                                                        'Delete Address'),
                                                    content: const Text(
                                                        'Are you Sure you want to delete this Address?'),
                                                    actions: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: const Text(
                                                              'Cancel')),
                                                      TextButton(
                                                          onPressed: () async {
                                                            AddressService
                                                                addressService =
                                                                AddressService();
                                                            await addressService
                                                                .deleteAddress(
                                                                    address[index]
                                                                        .id,
                                                                    context)
                                                                .whenComplete(
                                                                    () => context
                                                                        .read<
                                                                            AddressBloc>()
                                                                        .add(
                                                                            FetchAddressEvent()));
                                                            if (context
                                                                .mounted) {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            }
                                                          },
                                                          child: const Text(
                                                              'Delete'))
                                                    ],
                                                  ));
                                        },
                                        icon: const Icon(
                                          Icons.delete_outlined,
                                          color: kRed,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditAddressScreen(
                                                        city: address[index]
                                                            .cityName,
                                                        country: address[index]
                                                            .countryName,
                                                        id: address[index].id,
                                                        name:
                                                            address[index].name,
                                                        phoneNumber:
                                                            address[index]
                                                                .phoneNumber,
                                                        postalCode:
                                                            address[index]
                                                                .pinCode,
                                                        street: address[index]
                                                            .streetName,
                                                      )));
                                        },
                                        icon: const Icon(
                                          Icons.edit_outlined,
                                          color: kGreen,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        kHeight10
                      ],
                    );
                  }),
            );
          }
        } else if (state is ErrorAddressState) {
          return Center(child: Text('Error ${state.error}'));
        } else {
          return const Center(child: Text('Unknown Error'));
        }
      },
    );
  }
}
