import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kicks_cart/Data/Service/cart/cart_functions.dart';
import 'package:kicks_cart/Data/Service/products/config.dart';
import 'package:kicks_cart/Domain/models/wishlist/get_wishlist_model.dart';
import 'package:kicks_cart/application/business%20logic/wishlist/bloc/bloc/wish_list_bloc.dart';
import 'package:kicks_cart/application/presentation/utils/colors.dart';

class FavoriteProducts extends StatefulWidget {
  final BuildContext context;
  const FavoriteProducts({
    super.key,
    required this.context,
  });

  @override
  State<FavoriteProducts> createState() => _FavoriteProductsState();
}

class _FavoriteProductsState extends State<FavoriteProducts> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListBloc, WishListState>(
      builder: (context, state) {
        if (state is LoadingWishListState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedWishListState) {
          List<WishListModel>? wishList = state.wishList;
          if (wishList.isEmpty) {
            return const Center(child: Text('Wish List is Empty'));
          } else {
            return Expanded(
              child: GridView.builder(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 17),
                itemCount: wishList.length,
                itemBuilder: (_, int index) {
                  String imageFileName = wishList[index].image[0];
                  String imageUrl = '$productUrl/$imageFileName';
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            height: 90,
                            width: 150,
                          ),
                          Text(
                            wishList[index].name,
                            style: const TextStyle(fontSize: 15),
                          ),
                          Text(
                            wishList[index].price.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton.icon(
                              onPressed: () async {
                                showDialog(
                                    context: widget.context,
                                    builder: (_) => AlertDialog(
                                          title: const Text(
                                              'Delete from Wishlist'),
                                          content: const Text(
                                              'Are you Sure you want to delete?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Cancel')),
                                            TextButton(
                                                onPressed: () async {
                                                  await deleteCart(
                                                          wishList[index].id,
                                                          widget.context)
                                                      .whenComplete(() => widget
                                                          .context
                                                          .read<WishListBloc>()
                                                          .add(
                                                              FetchwishListEvent()));
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Delete'))
                                          ],
                                        ));
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: kRed,
                              ),
                              label: const Text(
                                'Remove',
                                style: TextStyle(color: kBlack),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        } else if (state is ErrorWishListState) {
          return Center(
            child: Text('Error${state.error}'),
          );
        } else {
          return const Center(child: Text('Unknown Error'));
        }
      },
    );
  }
}
