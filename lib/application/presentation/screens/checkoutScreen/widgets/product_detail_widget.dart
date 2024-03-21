import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Data/Service/products/config.dart';
import 'package:kicks_cart/Domain/models/cart/addCartModel/getCartModel/get_cart_model.dart';
import 'package:kicks_cart/application/business%20logic/cart/bloc/cart_bloc.dart';

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is LoadingCartState) {
          return Center(child: const CircularProgressIndicator());
        } else if (state is LoadedCartState) {
          List<GetCartModel> cart = state.cart;
          return ListView.builder(
            shrinkWrap: true,
            itemCount: cart.length,
            itemBuilder: (context, index) {
              String imageFileName = cart[index].image[0];
              String imageUrl = '$productUrl/$imageFileName';
              return Container(
                height: 150,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 140,
                          width: 140,
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            cart[index].name,
                            style: const TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          );
        } else if (state is ErrorCartState) {
          return const Center(child: Text('Error Loading Cart'));
        } else {
          return const Text('unknown error');
        }
      },
    );
  }
}
