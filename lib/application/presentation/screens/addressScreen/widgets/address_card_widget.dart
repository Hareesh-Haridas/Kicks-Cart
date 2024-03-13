import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Domain/models/address/get_address_model.dart';
import 'package:kicks_cart/application/business%20logic/address/bloc/bloc/address_bloc.dart';
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
                          height: 130,
                          width: 300,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(address[index].name),
                                Text(address[index].phoneNumber.toString()),
                                kHeight10,
                                Expanded(
                                    child: Text(
                                        'sdnfsjdncjsdncjksndckjsndcjksndcjnksdkjcnsjdcnsd'))
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
