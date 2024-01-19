import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/carousel_slider.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/product_lists.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.token});
  final token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //  kWidth20,
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    child: Text(
                      "Good Day to Shopping",
                      style: TextStyle(color: kWhite),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: kWhite,
                    ),
                  )
                ],
              ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 26),
                    child: Text(
                      "Welcome Hareesh Haridas",
                      style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              kHeight30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
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
                  )
                ],
              ),
              kHeight30,
              const Row(
                children: [
                  kWidth30,
                  Text(
                    "Popular Brands",
                    style: TextStyle(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              kHeight10,
              Container(
                height: 100,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: kWhite,
                              ),
                              child: Image.asset(
                                'assets/homescreen/crocs.png',
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Text(
                              "Crocs",
                              style: TextStyle(color: kWhite),
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Container(
                width: MediaQuery.of(context).size.width, height: 1000,
                //  height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      kHeight10,
                      CarouselBanner(),
                      kHeight10,
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Popular products",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "View all",
                                style: TextStyle(
                                  color: kGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const ProductLists(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueGrey[900],
        child: const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 20,
          ),
          child: GNav(
            color: kWhite,
            activeColor: kWhite,
            tabBackgroundColor: Colors.amber,
            gap: 8,
            padding: EdgeInsets.all(11),
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.storefront_outlined,
                text: 'Store',
              ),
              GButton(
                icon: Icons.favorite_outline,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.person_2_outlined,
                text: 'Profile',
              )
            ],
          ),
        ),
      ),
    );
  }
}
