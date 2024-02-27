import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
          Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(border: Border.all(color: kGrey)),
          ),
          kWidth10,
          Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(border: Border.all(color: kGrey)),
          ),
          kWidth10,
          Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(border: Border.all(color: kGrey)),
          ),
          kWidth10,
          Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(border: Border.all(color: kGrey)),
          ),
          kWidth10,
        ],
      ),
    );
  }
}
