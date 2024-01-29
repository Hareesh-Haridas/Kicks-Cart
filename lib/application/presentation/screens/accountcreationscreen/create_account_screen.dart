import 'package:flutter/material.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/application/presentation/screens/accountcreationscreen/widgets/account_creation_widgets.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

TextEditingController sNameController = TextEditingController();
TextEditingController sEmailController = TextEditingController();
TextEditingController sPhoneNumberController = TextEditingController();
TextEditingController sPasswordController = TextEditingController();
TextEditingController sLastNameController = TextEditingController();

bool isPasswordVisible = false;
bool isChecked = false;

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final GlobalKey<FormState> validatekey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: SafeArea(
        child: Form(
          key: validatekey2,
          child: Column(
            children: [
              const ArrowBackButton(),
              const CreateAccountText(),
              kHeight20,
              const FirstName(),
              const LastName(),
              const EMail(),
              const PhoneNumber(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: sPasswordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Password",
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        icon: !isPasswordVisible
                            ? const Icon(Icons.visibility_off_outlined)
                            : const Icon(Icons.visibility_outlined),
                      ),
                      prefixIcon: const Icon(Icons.lock_outline)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  kWidth20,
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
                  const AgreeText(),
                  const PrivacyPolicyButton()
                ],
              ),
              SignInButton(
                validatekey2: validatekey2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
