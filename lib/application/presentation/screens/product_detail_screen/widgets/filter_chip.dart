import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

String selectedSize = 'small';

class _SizeSelectorState extends State<SizeSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth30,
        FilterChip(
          selectedColor: kGreen,
          label: Text(
            'Small',
            style: TextStyle(color: selectedSize == 'Small' ? kWhite : kBlack),
          ),
          selected: selectedSize == 'Small',
          onSelected: (bool value) {
            setState(() {
              selectedSize = 'Small';
            });
          },
        ),
        kWidth10,
        FilterChip(
          selectedColor: kGreen,
          label: Text(
            'Medium',
            style: TextStyle(color: selectedSize == 'Medium' ? kWhite : kBlack),
          ),
          selected: selectedSize == 'Medium',
          onSelected: (bool value) {
            setState(() {
              selectedSize = 'Medium';
            });
          },
        ),
        kWidth10,
        FilterChip(
          selectedColor: kGreen,
          label: Text(
            'Large',
            style: TextStyle(color: selectedSize == 'Large' ? kWhite : kBlack),
          ),
          selected: selectedSize == 'Large',
          onSelected: (bool value) {
            setState(() {
              selectedSize = 'Large';
            });
          },
        ),
      ],
    );
  }
}
