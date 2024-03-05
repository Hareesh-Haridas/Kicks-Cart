import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/application/business%20logic/product/bloc/bloc/product_bloc.dart';

class SearchWidget extends StatefulWidget {
  final BuildContext context;
  final Function(String) onSearch;
  const SearchWidget({
    super.key,
    required this.searchController,
    required this.context,
    required this.onSearch,
  });

  final TextEditingController searchController;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.searchController,
      onChanged: (query) {
        widget.onSearch(query);
      },
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
              onPressed: () {
                widget.searchController.clear();
                widget.onSearch('');
                widget.context.read<ProductBloc>().add(FetchProductsEvent());
              },
              icon: const Icon(Icons.clear)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(115),
          ),
          hintText: 'Search product'),
    );
  }
}
