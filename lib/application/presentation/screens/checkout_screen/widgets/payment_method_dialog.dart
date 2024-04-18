import 'package:flutter/material.dart';

class PaymentMethodDialog extends StatefulWidget {
  const PaymentMethodDialog({super.key});

  @override
  State<PaymentMethodDialog> createState() => _PaymentMethodDialogState();
}

String selectedPaymentMethod = 'Cash on Delivery';

class _PaymentMethodDialogState extends State<PaymentMethodDialog> {
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
