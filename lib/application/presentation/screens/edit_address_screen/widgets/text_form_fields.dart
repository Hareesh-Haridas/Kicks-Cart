import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.deny(
                  RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
            ],
            textCapitalization: TextCapitalization.words,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: editNamecontroller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                prefixIcon: Icon(Icons.person_outline)),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter Your Name';
              } else if (value.length < 3) {
                return 'Name should be atleast three letters';
              }
              return null;
            }),
        kHeight10,
        TextFormField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10)
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.deny(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
          ],
          textCapitalization: TextCapitalization.words,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: editStreetNamecontroller,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Street',
              prefixIcon: Icon(Icons.place_outlined)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Your Street Name';
            } else if (value.length < 3) {
              return 'Streat name should be at least three letters';
            }
            return null;
          },
        ),
        kHeight10,
        TextFormField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(6)
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: editPostalCodecontroller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Postal Code',
              prefixIcon: Icon(Icons.pin_outlined)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Your Postal Code';
            } else if (value.length < 6) {
              return 'Postal code must have 6 digits';
            }
            return null;
          },
        ),
        kHeight10,
        TextFormField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.deny(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
          ],
          textCapitalization: TextCapitalization.words,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: editCityNamecontroller,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'City',
              prefixIcon: Icon(Icons.location_city_outlined)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter your City';
            } else if (value.length < 3) {
              return 'City name should have atleast three letters';
            }
            return null;
          },
        ),
        kHeight10,
        TextFormField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.deny(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
          ],
          textCapitalization: TextCapitalization.words,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: editCountryNamecontroller,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Country',
              prefixIcon: Icon(Icons.language_outlined)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Your City Name';
            } else if (value.length < 3) {
              return 'Country name should have atleast 3 letters';
            }
            return null;
          },
        ),
        kHeight20,
      ],
    );
  }
}
