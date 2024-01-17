import 'package:flutter/material.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/home_screen.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

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
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "First Name",
            prefixIcon: const Icon(Icons.person_2_outlined)),
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
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Last Name",
            prefixIcon: const Icon(Icons.person_2_outlined)),
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
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "E-mail",
            prefixIcon: const Icon(Icons.mail_outline)),
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
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: "Phone Number",
            prefixIcon: const Icon(Icons.call_outlined)),
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
      onPressed: () {},
      child: const Text(
        "Privacy Policy",
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            color: Colors.blueGrey[900],
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            minWidth: MediaQuery.of(context).size.width * 0.9,
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
