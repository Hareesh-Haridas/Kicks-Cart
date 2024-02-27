import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kicks_cart/Data/Service/auth/authorization_functions.dart';
import 'package:kicks_cart/Domain/models/categoryModel/category_model.dart';
import 'package:kicks_cart/application/business%20logic/category/bloc/bloc/category_bloc.dart';
import 'package:kicks_cart/application/business%20logic/product/bloc/bloc/product_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/carousel_slider.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/category_widget.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/log_out_button.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/product_list_widget.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/product_lists.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/search_widget.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/shopping_cart_button.dart';
import 'package:kicks_cart/application/presentation/screens/HomeScreen/Widgets/text_widgets.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.token});
  final token;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late CategoryBloc categoryBloc;
late ProductBloc productBloc;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    categoryBloc = context.read<CategoryBloc>();
    categoryBloc.add(FetchCategoriesEvent());
    productBloc = context.read<ProductBloc>();
    productBloc.add(FetchProductsEvent());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    categoryBloc = context.read<CategoryBloc>();
    categoryBloc.add(FetchCategoriesEvent());
    productBloc = context.read<ProductBloc>();
    productBloc.add(FetchProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //  kWidth20,
                  GoodDayToShoppingText(),
                  ShoppingCartButton(),
                  logOutButton()
                ],
              ),
              WelcomeTextWidget(),
              kHeight30,
              Searchwidget(),
              kHeight30,
              PopularBrandsText(),
              kHeight10,
              CategoryWidget(),
              ProductListWidget(
                context: context,
              )
            ],
          ),
        ),
      ),
    );
  }
}
