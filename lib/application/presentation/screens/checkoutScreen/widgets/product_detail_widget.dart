import 'package:flutter/material.dart';

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 140,
                width: 140,
                child: Image(
                  image: AssetImage(
                    'assets/homescreen/nike_shoe_1.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Text(
                  'Nike Sports shoe',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
