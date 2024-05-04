import 'package:flutter/material.dart';

class IndividualPaymentMethodDialog extends StatefulWidget {
  const IndividualPaymentMethodDialog({super.key});

  @override
  State<IndividualPaymentMethodDialog> createState() => _IndividualPaymentMethodDialogState();
}

String selectedPaymentMethod = 'Cash on Delivery';

class _IndividualPaymentMethodDialogState extends State<IndividualPaymentMethodDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Payment Method'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            title: const Text('Cash on Delivery'),
            value: 'Cash on Delivery',
            groupValue: selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          ),
          RadioListTile(
            title: const Text('Online Payment'),
            value: 'Online Payment',
            groupValue: selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          )
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop(selectedPaymentMethod);
            },
            child: const Text('Ok'))
      ],
    );
  }
}
