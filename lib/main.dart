import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/application/widgets/bottomNavigationWidget/root_page.dart';
import 'package:kicks_cart/application/business_logic/address/bloc/bloc/address_bloc.dart';
import 'package:kicks_cart/application/business_logic/bottom_nav/bloc/bottom_navigation_bloc.dart';
import 'package:kicks_cart/application/business_logic/cart/bloc/cart_bloc.dart';
import 'package:kicks_cart/application/business_logic/category/bloc/bloc/category_bloc.dart';
import 'package:kicks_cart/application/business_logic/orders/bloc/bloc/order_bloc.dart';
import 'package:kicks_cart/application/business_logic/product/bloc/bloc/product_bloc.dart';
import 'package:kicks_cart/application/business_logic/total_amount/bloc/bloc/total_amount_bloc.dart';
import 'package:kicks_cart/application/business_logic/wishlist/bloc/bloc/wish_list_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/loginscreen/loginscreen.dart';
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
        BlocProvider<CartBloc>(create: (context) => CartBloc()),
        BlocProvider<WishListBloc>(create: (context) => WishListBloc()),
        BlocProvider<AddressBloc>(create: (context) => AddressBloc()),
        BlocProvider<TotalAmountBloc>(create: (context) => TotalAmountBloc()),
        BlocProvider<OrderBloc>(create: (context) => OrderBloc())
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
