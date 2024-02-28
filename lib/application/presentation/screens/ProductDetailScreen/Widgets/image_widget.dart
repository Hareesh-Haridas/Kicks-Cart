import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ImageWidget extends StatefulWidget {
  final String image1;
  final String image2;
  final String image3;
  final String image4;
  const ImageWidget({
    super.key,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
  });

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
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
            child: Image.network(
              widget.image1,
              fit: BoxFit.cover,
            ),
          ),
          kWidth10,
          Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(border: Border.all(color: kGrey)),
            child: Image.network(
              widget.image2,
              fit: BoxFit.cover,
            ),
          ),
          kWidth10,
          Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(border: Border.all(color: kGrey)),
            child: Image.network(
              widget.image3,
              fit: BoxFit.cover,
            ),
          ),
          kWidth10,
          Container(
            height: 100,
            width: 300,
            decoration: BoxDecoration(border: Border.all(color: kGrey)),
            child: Image.network(
              widget.image4,
              fit: BoxFit.cover,
            ),
          ),
          kWidth10,
        ],
      ),
    );
  }
}
