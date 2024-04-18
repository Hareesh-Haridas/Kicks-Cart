import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/data/Service/address/adress_functions.dart';
import 'package:kicks_cart/application/business_logic/address/bloc/bloc/address_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/edit_address_screen/edit_address_screen.dart';
import 'package:kicks_cart/application/presentation/screens/edit_address_screen/widgets/text_form_fields.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class SaveChangesButton extends StatefulWidget {
  final String id;
  const SaveChangesButton({super.key, required this.id});

  @override
  State<SaveChangesButton> createState() => _SaveChangesButtonState();
}

class _SaveChangesButtonState extends State<SaveChangesButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: MaterialButton(
                onPressed: () async {
                  if (editAddressKey.currentState!.validate()) {
                    AddressService addressService = AddressService();
                    await addressService
                        .editAddress(
                            widget.id,
                            editNamecontroller.text,
                            int.tryParse(editPhoneNumbercontroller.text) ?? 0,
                            editStreetNamecontroller.text,
                            int.tryParse(editPostalCodecontroller.text) ?? 0,
                            editCityNamecontroller.text,
                            editCountryNamecontroller.text,
                            context)
                        .whenComplete(() => context
                            .read<AddressBloc>()
                            .add(FetchAddressEvent()));
                  }
                },
                color: Colors.blueGrey[900],
                textColor: kWhite,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )))
      ],
    );
  }
}
