import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ProductNameWidget extends StatefulWidget {
  final String name;
  const ProductNameWidget({
    super.key,
    required this.name,
  });

  @override
  State<ProductNameWidget> createState() => _ProductNameWidgetState();
}

class _ProductNameWidgetState extends State<ProductNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth30,
        Text(
          widget.name,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}

class ProductPriceWidget extends StatefulWidget {
  final int price;
  const ProductPriceWidget({
    super.key,
    required this.price,
  });

  @override
  State<ProductPriceWidget> createState() => _ProductPriceWidgetState();
}

class _ProductPriceWidgetState extends State<ProductPriceWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth30,
        Text(
          '₹${widget.price.toString()}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth30,
        Text(
          'Product Description',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class ProductDescriptionDetail extends StatefulWidget {
  final String description;
  const ProductDescriptionDetail({
    super.key,
    required this.description,
  });

  @override
  State<ProductDescriptionDetail> createState() =>
      _ProductDescriptionDetailState();
}

class _ProductDescriptionDetailState extends State<ProductDescriptionDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [kWidth30, Expanded(child: Text(widget.description))],
      ),
    );
  }
}
