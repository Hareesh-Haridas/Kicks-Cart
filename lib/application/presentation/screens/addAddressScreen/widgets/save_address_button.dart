import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/address/adress_functions.dart';
import 'package:kicks_cart/Domain/models/address/add_address_model.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class SaveAddressButton extends StatefulWidget {
  final String name;
  final int phoneNumber;
  final String streetName;
  final int postalCode;
  final String cityName;
  final String countryName;
  final GlobalKey<FormState> addressFormkey;
  const SaveAddressButton({
    super.key,
    required this.addressFormkey,
    required this.name,
    required this.phoneNumber,
    required this.streetName,
    required this.postalCode,
    required this.cityName,
    required this.countryName,
  });

  @override
  State<SaveAddressButton> createState() => _SaveAddressButtonState();
}

class _SaveAddressButtonState extends State<SaveAddressButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () async {
              AddAddressModel addAddressModel = AddAddressModel(
                  name: widget.name,
                  phoneNumber: widget.phoneNumber,
                  streetName: widget.streetName,
                  postalCode: widget.postalCode,
                  cityName: widget.cityName,
                  countryName: widget.countryName);
              if (widget.addressFormkey.currentState!.validate()) {
                await addAddress(
                    context,
                    addAddressModel.name,
                    addAddressModel.phoneNumber,
                    addAddressModel.streetName,
                    addAddressModel.postalCode,
                    addAddressModel.cityName,
                    addAddressModel.countryName);
              }
            },
            color: Colors.blueGrey[900],
            textColor: kWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            height: 50,
            child: const Text(
              "Save",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
