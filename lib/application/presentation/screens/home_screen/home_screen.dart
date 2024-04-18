import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/application/business_logic/category/bloc/bloc/category_bloc.dart';
import 'package:kicks_cart/application/business_logic/product/bloc/bloc/product_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/home_screen/widgets/category_widget.dart';
import 'package:kicks_cart/application/presentation/screens/home_screen/widgets/log_out_button.dart';
import 'package:kicks_cart/application/presentation/screens/home_screen/widgets/product_list_widget.dart';
import 'package:kicks_cart/application/presentation/screens/home_screen/widgets/search_widget.dart';
import 'package:kicks_cart/application/presentation/screens/home_screen/widgets/shopping_cart_button.dart';
import 'package:kicks_cart/application/presentation/screens/home_screen/widgets/text_widgets.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //  kWidth20,
                  GoodDayToShoppingText(),
                  ShoppingCartButton(),
                  LogOutButton()
                ],
              ),
              const WelcomeTextWidget(),
              kHeight30,
              const Searchwidget(),
              kHeight30,
              const PopularBrandsText(),
              kHeight10,
              const CategoryWidget(),
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
