import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ProductNameWidget extends StatefulWidget {
  final String productName;
  const ProductNameWidget({
    super.key,
    required this.productName,
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
          widget.productName,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}

class ProductPriceWidget extends StatefulWidget {
  final int productPrice;
  const ProductPriceWidget({
    super.key,
    required this.productPrice,
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
          widget.productPrice.toString(),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
    return Row(
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
  final String productDescription;
  const ProductDescriptionDetail({
    super.key,
    required this.productDescription,
  });

  @override
  State<ProductDescriptionDetail> createState() =>
      _ProductDescriptionDetailState();
}

class _ProductDescriptionDetailState extends State<ProductDescriptionDetail> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [kWidth30, Expanded(child: Text(widget.productDescription))],
      ),
    );
  }
}
