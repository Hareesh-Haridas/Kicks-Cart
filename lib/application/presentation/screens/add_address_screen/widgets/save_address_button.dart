import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/data/Service/address/adress_functions.dart';

import 'package:kicks_cart/application/business_logic/address/bloc/bloc/address_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/add_address_screen/add_address_screen.dart';
import 'package:kicks_cart/application/presentation/screens/add_address_screen/widgets/text_form_field_widgets.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class SaveAddressButton extends StatefulWidget {
  const SaveAddressButton({
    super.key,
  });

  @override
  State<SaveAddressButton> createState() => _SaveAddressButtonState();
}

class _SaveAddressButtonState extends State<SaveAddressButton> {
  bool saveAddressLoading = false;
  @override
  Widget build(BuildContext context) {
    return saveAddressLoading
        ? const CircularProgressIndicator()
        : Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () async {
                    if (addressFormKey.currentState!.validate()) {
                      setState(() {
                        saveAddressLoading = true;
                      });
                      await Future.delayed(const Duration(milliseconds: 50));
                      if (context.mounted) {
                        AddressService addressService = AddressService();
                        await addressService
                            .addAddress(
                                context,
                                addressNameController.text,
                                int.tryParse(
                                        addressPhoneNumberController.text) ??
                                    0,
                                streetController.text,
                                int.tryParse(postalCodeController.text) ?? 0,
                                cityController.text,
                                countryController.text)
                            .whenComplete(() => context
                                .read<AddressBloc>()
                                .add(FetchAddressEvent()));
                        setState(() {
                          saveAddressLoading = false;
                        });
                      }
                    }
                  },
                  color: Colors.blueGrey[900],
                  textColor: kWhite,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
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
