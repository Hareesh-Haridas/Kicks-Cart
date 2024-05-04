import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/application/business_logic/address/bloc/bloc/address_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/indivual_product_checkout_screen/individual_product_checkout_screen.dart';
import 'package:kicks_cart/domain/models/address/get_address_model.dart';

class AddressSelector extends StatefulWidget {
  final AddressSelectedCallback onAddressSelected;
  final AddressIdCallback onAddressId;
  const AddressSelector(
      {super.key, required this.onAddressSelected, required this.onAddressId});

  @override
  State<AddressSelector> createState() => _AddressSelectorState();
}

class _AddressSelectorState extends State<AddressSelector> {
  String addressId = '';
  String selectedAddress = '';

  late AddressBloc addressBloc;
  @override
  void initState() {
    super.initState();
    addressBloc = context.read<AddressBloc>();
    addressBloc.add(FetchAddressEvent());
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose Shipping Address'),
      content: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state is LoadingAddressState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedAddressState) {
            List<GetAddressModel> address = state.address;
            return ListView.builder(
              itemCount: address.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile(
                      title: Text(
                          '${address[index].name} ${address[index].cityName}Ph No: ${address[index].phoneNumber}'),
                      value:
                          '${address[index].name} ${address[index].cityName}Ph No: ${address[index].phoneNumber}',
                      groupValue: selectedAddress,
                      onChanged: (value) {
                        setState(() {
                          selectedAddress = value!;
                          addressId = address[index].id;
                        });
                      },
                    )
                  ],
                );
              },
            );
          } else if (state is ErrorAddressState) {
            return const Text('Error');
          } else {
            return const Text('unknown error');
          }
        },
      ),
      actions: [
        TextButton(
            onPressed: () {
              widget.onAddressId(addressId);
              widget.onAddressSelected(selectedAddress);
              Navigator.of(context).pop();
            },
            child: const Text('Ok'))
      ],
    );
  }
}
