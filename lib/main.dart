import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubit/favourite_items_cubit.dart';
import 'package:storeapp/cubitGetAllCategories/get_all_categories_cubit.dart';
import 'package:storeapp/cubitGetAllProducts/get_all_product_cubit.dart';
import 'package:storeapp/cubitGetItemsCategories/get_items_categories_cubit.dart';
import 'package:storeapp/screens/add_product_screen.dart';
import 'package:storeapp/screens/categoreis_screen.dart';
import 'package:storeapp/screens/favourite_screen.dart';
import 'package:storeapp/screens/home_screen.dart';
import 'package:storeapp/screens/item_categories_screen.dart';
import 'package:storeapp/screens/navbar_screen.dart';
import 'package:storeapp/screens/update_product_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => GetAllProductCubit()..getAllProducts(),
      ),
      BlocProvider(
        create: (context) => GetAllCategoriesCubit()..getallcategories(),
      ),
      BlocProvider(
        create: (context) => GetItemsCategoriesCubit(),
      ),
      BlocProvider(
        create: (context) => FavouriteItemsCubit(),
      ),
    ], child: const StoreApp()),
  );
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        UpdateProductScreen.id: (context) => const UpdateProductScreen(),
        AddProductScreen.id: (context) => const AddProductScreen(),
        CategoriesScreen.id: (context) => const CategoriesScreen(),
        ItemCategories.id: (context) => const ItemCategories(),
        NavBarScreen.id: (context) => const NavBarScreen(),
        FavouriteScreen.id: (context) => const FavouriteScreen(),
      },
      initialRoute: NavBarScreen.id,
    );
  }
}
