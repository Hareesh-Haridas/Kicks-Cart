import 'package:flutter/material.dart';

import 'package:kicks_cart/application/presentation/screens/add_address_screen/widgets/save_address_button.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class AddressTextFormFields extends StatefulWidget {
  const AddressTextFormFields({
    super.key,
  });

  @override
  State<AddressTextFormFields> createState() => _AddressTextFormFieldsState();
}

TextEditingController addressNameController = TextEditingController();
TextEditingController addressPhoneNumberController = TextEditingController();
TextEditingController streetController = TextEditingController();
TextEditingController postalCodeController = TextEditingController();
TextEditingController cityController = TextEditingController();
TextEditingController countryController = TextEditingController();

class _AddressTextFormFieldsState extends State<AddressTextFormFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight30,
        TextFormField(
          controller: addressNameController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
              prefixIcon: Icon(Icons.person_outline)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Your Name';
            }
            return null;
          },
        ),
        kHeight10,
        TextFormField(
          keyboardType: TextInputType.number,
          controller: addressPhoneNumberController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone Number',
              prefixIcon: Icon(Icons.call_outlined)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter your Phone Number';
            } else if (value.length != 10) {
              return 'Please Enter a Valid Phone Number';
            }
            return null;
          },
        ),
        kHeight10,
        TextFormField(
          controller: streetController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Street',
              prefixIcon: Icon(Icons.place_outlined)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Your Street Name';
            }
            return null;
          },
        ),
        kHeight10,
        TextFormField(
          keyboardType: TextInputType.number,
          controller: postalCodeController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Postal Code',
              prefixIcon: Icon(Icons.pin_outlined)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Your Postal Code';
            }
            return null;
          },
        ),
        kHeight10,
        TextFormField(
          controller: cityController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'City',
              prefixIcon: Icon(Icons.location_city_outlined)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter your City';
            }
            return null;
          },
        ),
        kHeight10,
        TextFormField(
          controller: countryController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Country',
              prefixIcon: Icon(Icons.language_outlined)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Your City Name';
            }
            return null;
          },
        ),
        kHeight20,
        const SaveAddressButton()
      ],
    );
  }
}
