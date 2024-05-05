import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/cubitGetItemsCategories/get_items_categories_cubit.dart';
import 'package:storeapp/screens/favourite_screen.dart';
import 'package:storeapp/widgets/custom_card.dart';

class ItemCategories extends StatelessWidget {
  const ItemCategories({super.key});
  static String id = 'Item Categorey';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('New Trend'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, FavouriteScreen.id);
              },
              icon: const Icon(FontAwesomeIcons.cartPlus),
              color: Colors.black,
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 70),
        child: BlocBuilder<GetItemsCategoriesCubit, GetItemsCategoriesState>(
          builder: (context, state) {
            if (state is GetItemsCategoriesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetItemsCategoriesLoaded) {
              return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 80),
                  itemCount: state.productCategories.length,
                  itemBuilder: ((context, index) {
                    return CustomCard(
                      product: state.productCategories[index],
                    );
                  }));
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
