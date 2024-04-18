import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kicks_cart/data/Service/auth/authorization_functions.dart';

import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class OtpScreen extends StatefulWidget {
  final String otp;
  const OtpScreen({super.key, required this.otp});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

GlobalKey<FormState> otpkey = GlobalKey<FormState>();
TextEditingController otpController1 = TextEditingController();
TextEditingController otpController2 = TextEditingController();
TextEditingController otpController3 = TextEditingController();
TextEditingController otpController4 = TextEditingController();

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Form(
          key: otpkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Lottie.asset(
              //   "assets/animations/otpEmail.json",
              //   height: 100,
              //   fit: BoxFit.cover,
              // ),
              const Text('Enter OTP sent to your e-mail'),
              kHeight38,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: otpController1,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: otpController2,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: otpController3,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 64,
                      child: TextFormField(
                        controller: otpController4,
                        decoration:
                            const InputDecoration(border: OutlineInputBorder()),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              kHeight38,
              ElevatedButton(
                onPressed: () async {
                  AuthService authService = AuthService();
                  await authService.otpVerify(context, widget.otp);
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
