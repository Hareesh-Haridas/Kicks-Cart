import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/addAddressScreen/widgets/heading_widget.dart';
import 'package:kicks_cart/application/presentation/screens/addAddressScreen/widgets/save_address_button.dart';
import 'package:kicks_cart/application/presentation/screens/addAddressScreen/widgets/text_form_field_widgets.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  TextEditingController addressNameController = TextEditingController();
  TextEditingController addressPhoneNumberController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
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
                child: AddressTextFormFields(
                  cityNameController: cityController,
                  countryNameController: countryController,
                  nameController: addressNameController,
                  phoneNumberController: addressPhoneNumberController,
                  postalCodeController: postalCodeController,
                  streetController: streetController,
                ),
              ),
              SaveAddressButton(
                  addressFormkey: addressFormKey,
                  name: addressNameController.text,
                  phoneNumber:
                      int.tryParse(addressPhoneNumberController.text) ?? 0,
                  streetName: streetController.text,
                  postalCode: int.tryParse(postalCodeController.text) ?? 0,
                  cityName: cityController.text,
                  countryName: countryController.text)
            ],
          ),
        ),
      )),
    );
  }
}
