import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kicks_cart/data/Service/auth/authorization_functions.dart';

import 'package:kicks_cart/application/presentation/screens/accountcreationscreen/create_account_screen.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/loginscreen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

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

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateAccountScreen()));
            },
            textColor: kBlack,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: kGrey),
                borderRadius: BorderRadius.circular(10)),
            height: 50,
            child: const Text(
              "Create Account",
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

class SignInButton extends StatelessWidget {
  final GlobalKey<FormState> formkey;
  const SignInButton({
    super.key,
    required this.formkey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            onPressed: () async {
              if (formkey.currentState!.validate()) {
                AuthService authService = AuthService();
                await authService.loginUser(context);
              }
            },
            color: Colors.blueGrey[900],
            textColor: kWhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            height: 50,
            child: const Text(
              "Sign in",
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

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "Forgot password?",
        style: TextStyle(color: kGrey),
      ),
    );
  }
}

class EmailTextfield extends StatelessWidget {
  const EmailTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: lEmailController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: "E-Mail",
      ),
      validator: (value) {
        if (value == null || value.isEmpty || !value.contains('@')) {
          return 'Please enter a valid e-mail';
        }
        return null;
      },
    );
  }
}

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Discover Limitless Choices and Unlimited\nConvenience.",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class WelcomeBackText extends StatelessWidget {
  const WelcomeBackText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Welcome back,",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class KicksCartText extends StatelessWidget {
  const KicksCartText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Kicks Cart',
          style: GoogleFonts.bangers(fontSize: 40),
        )
      ],
    );
  }
}
