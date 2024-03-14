import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/editAddressScreen/widgets/save_changes_button.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class EditAddressTextFormFields extends StatefulWidget {
  const EditAddressTextFormFields({super.key});

  @override
  State<EditAddressTextFormFields> createState() =>
      _EditAddressTextFormFieldsState();
}

TextEditingController editNamecontroller = TextEditingController();
TextEditingController editPhoneNumbercontroller = TextEditingController();
TextEditingController editStreetNamecontroller = TextEditingController();
TextEditingController editPostalCodecontroller = TextEditingController();
TextEditingController editCityNamecontroller = TextEditingController();
TextEditingController editCountryNamecontroller = TextEditingController();

class _EditAddressTextFormFieldsState extends State<EditAddressTextFormFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight30,
        TextFormField(
            controller: editNamecontroller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                prefixIcon: Icon(Icons.person_outline)),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Your Name';
              }
              return null;
            }),
        kHeight10,
        TextFormField(
          controller: editPhoneNumbercontroller,
          keyboardType: TextInputType.number,
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
          controller: editStreetNamecontroller,
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
          controller: editPostalCodecontroller,
          keyboardType: TextInputType.number,
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
          controller: editCityNamecontroller,
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
          controller: editCountryNamecontroller,
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
