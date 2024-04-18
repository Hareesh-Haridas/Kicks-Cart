import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/add_address_screen/widgets/heading_widget.dart';

import 'package:kicks_cart/application/presentation/screens/add_address_screen/widgets/text_form_field_widgets.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

class _AddAddressScreenState extends State<AddAddressScreen> {
  @override
  void initState() {
    super.initState();
    addressNameController.clear();
    addressPhoneNumberController.clear();
    streetController.clear();
    postalCodeController.clear();
    cityController.clear();
    countryController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              kHeight30,
              const AddNewAddressHeading(),
              Form(
                key: addressFormKey,
                child: const AddressTextFormFields(),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
