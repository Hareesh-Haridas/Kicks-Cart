import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/application/Widgets/bottomNavigationWidget/root_page.dart';
import 'package:kicks_cart/application/business%20logic/bottomNav/bloc/bottom_navigation_bloc.dart';
import 'package:kicks_cart/application/business%20logic/cart/bloc/cart_bloc.dart';
import 'package:kicks_cart/application/business%20logic/category/bloc/bloc/category_bloc.dart';
import 'package:kicks_cart/application/business%20logic/product/bloc/bloc/product_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/loginscreen.dart';
import 'package:kicks_cart/application/presentation/screens/onboardingscreens/onboardingscreen_1.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNavigationBloc>(
            create: (context) => BottomNavigationBloc()),
        BlocProvider<CategoryBloc>(create: (context) => CategoryBloc()),
        BlocProvider<ProductBloc>(create: (context) => ProductBloc()),
        BlocProvider<CartBloc>(create: (context) => CartBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)),
        home: AnimatedSplashScreen(
          splash: Text(
            'Kicks Cart',
            style: GoogleFonts.bangers(fontSize: 40),
          ),
          nextScreen: FutureBuilder(
            future: getAuthToken(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // return snapshot.data == true
                //     ? const OnboardingScreen1()
                //     : const LoginScreen();
                if (snapshot.data != null) {
                  return const RootPage();
                } else {
                  return const LoginScreen();
                }
              } else {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
          splashTransition: SplashTransition.slideTransition,
        ),
      ),
    );
  }
}
