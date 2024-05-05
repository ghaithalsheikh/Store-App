import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubit/favourite_items_cubit.dart';
import 'package:storeapp/widgets/custom_card.dart';

class FavouriteScreen extends StatelessWidget {
  static String id = 'Favourite screen';

  const FavouriteScreen({super.key});

  // bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.teal[100],
        ),
        body: BlocBuilder<FavouriteItemsCubit, FavouriteItemsState>(
          builder: (context, state) {
            if (state is FavouriteItemsAdd) {
              return Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ListView.builder(
                  itemCount: state.favouriteProduct.length,
                  itemBuilder: (context, index) {
                    final product = state.favouriteProduct[index];
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: CustomCard(
                        product: product,
                        icon: IconButton(
                            onPressed: () {
                              BlocProvider.of<FavouriteItemsCubit>(context)
                                  .removeItemToFaourite(product);
                            },
                            icon: const Icon(Icons.remove_circle)),
                      ),
                    );
                  },
                ),
              );
            } else if (state is FavouriteItemsRemove &&
                state.favouriteProduct!.isNotEmpty) {
              print('inside remove');
              return Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ListView.builder(
                  itemCount: state.favouriteProduct!.length,
                  itemBuilder: (context, index) {
                    final product = state.favouriteProduct![index];
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: CustomCard(
                        product: product,
                        icon: IconButton(
                            onPressed: () {
                              BlocProvider.of<FavouriteItemsCubit>(context)
                                  .removeItemToFaourite(product);
                            },
                            icon: const Icon(Icons.remove_circle)),
                      ),
                    );
                  },
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                alignment: Alignment.topCenter,
                child: const Text(
                  'your cart is empty',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            );
          },
        ));
  }
}
