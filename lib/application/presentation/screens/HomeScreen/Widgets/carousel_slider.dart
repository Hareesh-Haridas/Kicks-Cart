import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class CarouselBanner extends StatefulWidget {
  CarouselBanner({super.key});

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  int _current = 0;
  final List<Map<String, String>> carouselData = [
    {
      "text": "Sneakers of the Week",
      "imageUrl": "assets/homescreen/nike_shoe_1.png"
    },
    {
      "text": "Sneakers of the Week",
      "imageUrl": "assets/homescreen/nike_shoe_1.png"
    },
    {
      "text": "Sneakers of the Week",
      "imageUrl": "assets/homescreen/nike_shoe_1.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: carouselData.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              width: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(carouselData[index]["imageUrl"]!),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Text(
                  carouselData[index]["text"]!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
              height: 200,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastLinearToSlowEaseIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              carouselData.length,
              (index) => buildIndicator(_current, index),
            ))
      ],
    );
  }

  Widget buildIndicator(int index, int current) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: current == index ? Colors.black : Colors.grey),
    );
  }
}
