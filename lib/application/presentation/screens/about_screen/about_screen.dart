import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              kHeight20,
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  Text(
                    'Kicks Cart',
                    style: GoogleFonts.bangers(fontSize: 40),
                  )
                ],
              ),
              kHeight30,
              Row(
                children: [
                  Text("App Version: 1.0",
                      style: GoogleFonts.ptSans(fontSize: 15)),
                ],
              ),
              kHeight30,
              Row(
                children: [
                  Text(
                    "Privacy Policy",
                    style: GoogleFonts.ptSans(fontSize: 29),
                  ),
                ],
              ),
              kHeight30,
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Last updated: May 20, 2024.\nThis Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Generator.",
                    style: GoogleFonts.ptSans(),
                  )),
                ],
              ),
              kHeight10,
              Row(
                children: [
                  Text(
                    "Collecting and Using Your Personal Data",
                    style: GoogleFonts.ptSans(fontSize: 20),
                  )
                ],
              ),
              kHeight10,
              Row(
                children: [
                  Expanded(
                      child: Text(
                    "Types of Data Collected",
                    style: GoogleFonts.ptSans(fontSize: 15),
                  ))
                ],
              ),
              kHeight10,
              Row(
                children: [
                  Text(
                    "Personal Data",
                    style: GoogleFonts.ptSans(fontSize: 14),
                  )
                ],
              ),
              kHeight10,
              const Row(
                children: [
                  Expanded(
                    child: Text(
                        "While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:"),
                  )
                ],
              ),
              kHeight10,
              const Row(
                children: [
                  Text("* Email Address"),
                ],
              ),
              const Row(
                children: [Text("* First name and last name")],
              ),
              const Row(
                children: [Text("* Phone number")],
              ),
              const Row(
                children: [
                  Text("* Address, State, Province, ZIP/Postal code, City")
                ],
              ),
              const Row(
                children: [Text("* Usage Data")],
              ),
              kHeight10,
              Row(
                children: [
                  Text(
                    "Contact Us",
                    style: GoogleFonts.ptSans(fontSize: 20),
                  )
                ],
              ),
              kHeight10,
              const Row(
                children: [
                  Expanded(
                    child: Text(
                        "If you have any questions about this Privacy Policy, You can contact us:"),
                  )
                ],
              ),
              kHeight10,
              const Row(
                children: [Text("By email: hareeshharidas2003@gmail.com")],
              ),
              kHeight30
            ],
          ),
        ),
      )),
    );
  }
}
