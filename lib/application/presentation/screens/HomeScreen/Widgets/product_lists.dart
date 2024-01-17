import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class ProductLists extends StatefulWidget {
  const ProductLists({super.key});

  @override
  State<ProductLists> createState() => _ProductListsState();
}

class _ProductListsState extends State<ProductLists> {
  List<Map<String, String>> productData = [
    {
      "image": "assets/homescreen/nike_shoe_1.png",
      "name": "Nike Sports Shoe",
      "price": "Rs.5,000"
    },
    {
      "image": "assets/homescreen/nike_shoe_1.png",
      "name": "Nike Sports Shoe",
      "price": "Rs.5,000"
    },
    {
      "image": "assets/homescreen/nike_shoe_1.png",
      "name": "Nike Sports Shoe",
      "price": "Rs.5,000"
    },
    {
      "image": "assets/homescreen/nike_shoe_1.png",
      "name": "Nike Sports Shoe",
      "price": "Rs.5,000"
    },
    {
      "image": "assets/homescreen/nike_shoe_1.png",
      "name": "Nike Sports Shoe",
      "price": "Rs.5,000"
    },
    {
      "image": "assets/homescreen/nike_shoe_1.png",
      "name": "Nike Sports Shoe",
      "price": "Rs.5,000"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: productData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                  const BoxShadow(
                      color: kWhite,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0)
                ],
                // image: DecorationImage(
                //   image: AssetImage(productData[index]['image']!),
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline),
                      ),
                    ],
                  ),
                  // kHeight10,
                  Image.asset(
                    productData[index]['image']!,
                    fit: BoxFit.cover,
                    height: 90,
                    width: 150,
                  ),
                  const Text(
                    "Nike Sports shoe",
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                  ),
                  kHeight10,
                  const Row(
                    children: [
                      kWidth10,
                      Text(
                        "Rs.5,000",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
