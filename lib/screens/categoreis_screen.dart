import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubitGetAllCategories/get_all_categories_cubit.dart';
import 'package:storeapp/cubitGetItemsCategories/get_items_categories_cubit.dart';
import 'package:storeapp/screens/item_categories_screen.dart';
import 'package:storeapp/widgets/custom_categories.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  static String id = 'categories screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: BlocBuilder<GetAllCategoriesCubit, GetAllCategoriesState>(
          builder: (context, state) {
            if (state is GetAllCategoriesLoaded) {
              return GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 20),
                itemCount: state.categories.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomCategories(
                      categoriey: state.categories[index],
                      onTap: () {
                        if (index == 0) {
                          BlocProvider.of<GetItemsCategoriesCubit>(context)
                              .getcategoriesProduct(
                                  categoryName: state.categories[index]);
                          Navigator.pushNamed(context, ItemCategories.id);
                        } else if (index == 1) {
                          BlocProvider.of<GetItemsCategoriesCubit>(context)
                              .getcategoriesProduct(
                                  categoryName: state.categories[index]);
                          Navigator.pushNamed(context, ItemCategories.id);
                        } else if (index == 2) {
                          BlocProvider.of<GetItemsCategoriesCubit>(context)
                              .getcategoriesProduct(
                                  categoryName: state.categories[index]);
                          Navigator.pushNamed(context, ItemCategories.id);
                        } else if (index == 3) {
                          BlocProvider.of<GetItemsCategoriesCubit>(context)
                              .getcategoriesProduct(
                                  categoryName: state.categories[index]);
                          Navigator.pushNamed(context, ItemCategories.id);
                        }
                      },
                    ),
                  );
                }),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}


 
           
//                   clipBehavior: Clip.none,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 10,
//                       childAspectRatio: 1.5,
//                       mainAxisSpacing: 20),
//                   itemCount: categories.length,
//                   itemBuilder: ((context, index) {
//                     return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: CustomCategories(
//                           categoriey: categories[index],
//                           onTap: () {
//                             if (index == 0) {
//                               Navigator.pushNamed(context, ItemCategories.id,
//                                   arguments: categories[index]);
//                             } else if (index == 1) {
//                               Navigator.pushNamed(context, ItemCategories.id,
//                                   arguments: categories[index]);
//                             } else if (index == 2) {
//                               Navigator.pushNamed(context, ItemCategories.id,
//                                   arguments: categories[index]);
//                             } else if (index == 3) {
//                               Navigator.pushNamed(context, ItemCategories.id,
//                                   arguments: categories[index]);
//                             }
//                           },
//                         ));
//                   }),
//                 ),