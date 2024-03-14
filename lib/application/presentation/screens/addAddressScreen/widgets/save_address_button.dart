import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Data/Service/address/adress_functions.dart';
import 'package:kicks_cart/Domain/models/address/add_address_model.dart';
import 'package:kicks_cart/application/business%20logic/address/bloc/bloc/address_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/addAddressScreen/add_address_screen.dart';
import 'package:kicks_cart/application/presentation/screens/addAddressScreen/widgets/text_form_field_widgets.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class SaveAddressButton extends StatefulWidget {
  const SaveAddressButton({
    super.key,
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
              if (addressFormKey.currentState!.validate()) {
                await Future.delayed(const Duration(milliseconds: 50));
                await addAddress(
                        context,
                        addressNameController.text,
                        int.tryParse(addressPhoneNumberController.text) ?? 0,
                        streetController.text,
                        int.tryParse(postalCodeController.text) ?? 0,
                        cityController.text,
                        countryController.text)
                    .whenComplete(() =>
                        context.read<AddressBloc>().add(FetchAddressEvent()));
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
