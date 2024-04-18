import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/application/business_logic/product/bloc/bloc/product_bloc.dart';
import 'package:kicks_cart/application/presentation/screens/search_screen/widgets/product_list.dart';
import 'package:kicks_cart/application/presentation/screens/search_screen/widgets/search_widget.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';
import 'package:kicks_cart/application/presentation/utils/constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  late ProductBloc products;
  @override
  void initState() {
    super.initState();
    products = context.read<ProductBloc>();
    products.add(FetchProductsEvent());
    products.add(SearchProductsEvent(query: ''));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    products = context.read<ProductBloc>();
    products.add(FetchProductsEvent());
    products.add(SearchProductsEvent(query: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            kHeight38,
            SearchWidget(
              searchController: searchController,
              onSearch: (query) {
                products.add(SearchProductsEvent(query: query));
              },
              context: context,
            ),
            kHeight20,
            SearchProductLists(context: context)
          ],
        ),
      )),
    );
  }
}
