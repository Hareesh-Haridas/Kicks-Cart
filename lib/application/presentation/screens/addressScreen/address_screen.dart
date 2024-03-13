import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/application/business%20logic/address/bloc/bloc/address_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/addAddressScreen/add_address_screen.dart';
import 'package:kicks_cart/application/presentation/screens/addressScreen/widgets/address_card_widget.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

late AddressBloc addressbloc;

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    addressbloc = context.read<AddressBloc>();
    addressbloc.add(FetchAddressEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    addressbloc = context.read<AddressBloc>();
    addressbloc.add(FetchAddressEvent());
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
              const Row(
                children: [
                  kWidth30,
                  Text(
                    'Addresses',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              kHeight50,
              AddressCard()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddAddressScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
