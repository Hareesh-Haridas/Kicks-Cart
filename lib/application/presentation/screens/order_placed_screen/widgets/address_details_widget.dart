import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class AddressDetails extends StatefulWidget {
  final String address;
  final String cityName;
  final int phoneNumber;
  const AddressDetails({
    super.key,
    required this.address,
    required this.cityName,
    required this.phoneNumber,
  });

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: 300,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                      'Name: ${widget.address}| City: ${widget.cityName}| Ph: ${widget.phoneNumber}'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
