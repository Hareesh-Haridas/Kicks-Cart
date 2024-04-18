import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/search_screen/search_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class Searchwidget extends StatelessWidget {
  const Searchwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SearchScreen())),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    kWidth30,
                    Icon(
                      Icons.search,
                      color: kGrey,
                    ),
                    kWidth10,
                    Text(
                      "Search in Store",
                      style: TextStyle(color: kGrey),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
