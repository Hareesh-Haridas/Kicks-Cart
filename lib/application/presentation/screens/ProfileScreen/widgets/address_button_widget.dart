import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/addressScreen/address_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class AddressButton extends StatelessWidget {
  const AddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Address'),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: kGrey),
          borderRadius: BorderRadius.circular(10)),
      trailing: const Icon(Icons.chevron_right_outlined),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AddressScreen()));
      },
    );
  }
}
