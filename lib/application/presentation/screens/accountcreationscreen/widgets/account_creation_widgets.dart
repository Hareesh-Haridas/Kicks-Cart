import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kicks_cart/data/Service/auth/authorization_functions.dart';

import 'package:kicks_cart/application/presentation/screens/accountcreationscreen/create_account_screen.dart';

import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInOptionText extends StatelessWidget {
  const SignInOptionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Or Sign in With",
      style: TextStyle(color: kGrey),
    );
  }
}

class RightLine extends StatelessWidget {
  const RightLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 80,
      decoration: const BoxDecoration(
        color: kGrey,
      ),
    );
  }
}

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Image(
          image: AssetImage("assets/loginscreen/google_logo.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FacebookLogo extends StatelessWidget {
  const FacebookLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {},
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Image(
          image: AssetImage("assets/loginscreen/Facebook_Logo.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back))
      ],
    );
  }
}

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        kWidth20,
        Text(
          "Let's Create Your Account",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class FirstName extends StatelessWidget {
  const FirstName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.deny(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
        ],
        textCapitalization: TextCapitalization.words,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: sNameController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: "First Name",
            prefixIcon: const Icon(Icons.person_2_outlined)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Enter your First Name';
          } else if (value.length < 3) {
            return 'Name should be at least three letters';
          }
          return null;
        },
      ),
    );
  }
}

class LastName extends StatelessWidget {
  const LastName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.deny(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))
        ],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textCapitalization: TextCapitalization.words,
        controller: sLastNameController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: "Last Name",
            prefixIcon: const Icon(Icons.person_2_outlined)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your Last Name';
          } else if (value.length < 3) {
            'Name should be atleast three letters';
          }
          return null;
        },
      ),
    );
  }
}

class EMail extends StatelessWidget {
  const EMail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: sEmailController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: "E-mail",
            prefixIcon: const Icon(Icons.mail_outline)),
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              !value.contains('@') ||
              !value.contains('gmail.com')) {
            return 'Please enter a valid Email';
          }
          return null;
        },
      ),
    );
  }
}

class PhoneNumber extends StatelessWidget {
  const PhoneNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10)
        ],
        keyboardType: TextInputType.number,
        controller: sPhoneNumberController,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: "Phone Number",
            prefixIcon: const Icon(Icons.call_outlined)),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your phone number';
          } else if (value.length != 10) {
            'Phone number should have 10 digits';
          }
          return null;
        },
      ),
    );
  }
}

class AgreeText extends StatelessWidget {
  const AgreeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "I Agree to",
      style: TextStyle(fontWeight: FontWeight.w100),
    );
  }
}

class PrivacyPolicyButton extends StatelessWidget {
  const PrivacyPolicyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await launchInBrowser(Uri.parse(privacyPolicyUrl));
      },
      child: const Text(
        "Privacy Policy",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}

bool isLoading = false;

class SignInButton extends StatefulWidget {
  final GlobalKey<FormState> validatekey2;
  const SignInButton({
    super.key,
    required this.validatekey2,
  });

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: isLoading
              ? const CircularProgressIndicator()
              : MaterialButton(
                  onPressed: () async {
                    if (widget.validatekey2.currentState!.validate() &&
                        isChecked) {
                      setState(() {
                        isLoading = true;
                      });
                      AuthService authService = AuthService();
                      await authService.signUp(context).whenComplete(() {
                        setState(() {
                          isLoading = false;
                        });
                      });
                    } else if (!isChecked) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please agree to privacy policy',
                            style: TextStyle(color: kWhite),
                          ),
                          backgroundColor: kRed,
                        ),
                      );
                    }
                  },
                  color: Colors.blueGrey[900],
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 50,
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}

String privacyPolicyUrl =
    'https://www.termsfeed.com/live/7f639573-8314-417d-be0b-f69cd466218e';
Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not lauch $url');
  }
}
