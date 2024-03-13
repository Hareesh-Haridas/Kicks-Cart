import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/addAddressScreen/add_address_screen.dart';
import 'package:kicks_cart/application/presentation/screens/addAddressScreen/widgets/save_address_button.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class AddressTextFormFields extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController streetController;
  final TextEditingController postalCodeController;
  final TextEditingController cityNameController;
  final TextEditingController countryNameController;
  const AddressTextFormFields(
      {super.key,
      required this.nameController,
      required this.phoneNumberController,
      required this.streetController,
      required this.postalCodeController,
      required this.cityNameController,
      required this.countryNameController});

  @override
  State<AddressTextFormFields> createState() => _AddressTextFormFieldsState();
}

class _AddressTextFormFieldsState extends State<AddressTextFormFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight30,
        TextFormField(
          controller: widget.nameController,
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
          controller: widget.phoneNumberController,
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
          controller: widget.streetController,
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
          controller: widget.postalCodeController,
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
          controller: widget.cityNameController,
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
          controller: widget.countryNameController,
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
      ],
    );
  }
}
