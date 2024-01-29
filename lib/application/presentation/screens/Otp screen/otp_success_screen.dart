import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/loginscreen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:lottie/lottie.dart';

class OptSuccessScreen extends StatefulWidget {
  const OptSuccessScreen({super.key});

  @override
  State<OptSuccessScreen> createState() => _OptSuccessScreenState();
}

class _OptSuccessScreenState extends State<OptSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          kHeight38,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/animations/otpsuccess.json",
                  repeat: false, height: 200, fit: BoxFit.cover),
            ],
          ),
          kHeight38,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OTP Verification Success!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text("Go to Login Screen"),
                    color: Colors.blueGrey[900],
                    textColor: kWhite,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
