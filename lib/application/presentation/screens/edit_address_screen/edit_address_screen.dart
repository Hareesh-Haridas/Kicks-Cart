import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/edit_address_screen/widgets/edit_address_heading_widget.dart';
import 'package:kicks_cart/application/presentation/screens/edit_address_screen/widgets/save_changes_button.dart';
import 'package:kicks_cart/application/presentation/screens/edit_address_screen/widgets/text_form_fields.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class EditAddressScreen extends StatefulWidget {
  final String id;
  final String name;
  final int phoneNumber;
  final String street;
  final int postalCode;
  final String city;
  final String country;
  const EditAddressScreen(
      {super.key,
      required this.id,
      required this.name,
      required this.phoneNumber,
      required this.street,
      required this.postalCode,
      required this.city,
      required this.country});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

final GlobalKey<FormState> editAddressKey = GlobalKey<FormState>();

class _EditAddressScreenState extends State<EditAddressScreen> {
  @override
  void initState() {
    super.initState();
    editNamecontroller = TextEditingController(text: widget.name);
    editPhoneNumbercontroller =
        TextEditingController(text: widget.phoneNumber.toString());
    editStreetNamecontroller = TextEditingController(text: widget.street);
    editPostalCodecontroller =
        TextEditingController(text: widget.postalCode.toString());
    editCityNamecontroller = TextEditingController(text: widget.city);
    editCountryNamecontroller = TextEditingController(text: widget.country);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            kHeight30,
            const EditAddressHeading(),
            Form(
              key: editAddressKey,
              child: const EditAddressTextFormFields(),
            ),
            SaveChangesButton(
              id: widget.id,
            )
          ],
        ),
      )),
    );
  }
}
