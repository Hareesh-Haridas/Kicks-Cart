import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/widgets/login_screen_widgets.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final GlobalKey<FormState> validatekey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: validatekey,
            child: Column(
              children: [
                kHeight38,
                const KicksCartText(),
                kHeight30,
                const WelcomeBackText(),
                kHeight10,
                const SubtitleText(),
                kHeight10,
                const EmailTextfield(),
                kHeight20,
                TextField(
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: !isPasswordVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      activeColor: Colors.blue,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(
                          () {
                            isChecked = value!;
                          },
                        );
                      },
                    ),
                    const Text(
                      "Remeber me",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    const ForgotPasswordButton()
                  ],
                ),
                kHeight10,
                const SignInButton(),
                kHeight10,
                const CreateAccountButton(),
                kHeight30,
                const Row(
                  children: [
                    kWidth30,
                    RightLine(),
                    kWidth10,
                    SignInOptionText(),
                    kWidth10,
                    RightLine(),
                  ],
                ),
                kHeight30,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [GoogleButton(), kWidth20, FacebookLogo()],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
