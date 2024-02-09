import 'package:flutter/material.dart';
import 'package:storeapp/screens/add_product_screen.dart';
import 'package:storeapp/screens/categoreis_screen.dart';
import 'package:storeapp/screens/favourite_screen.dart';
import 'package:storeapp/screens/home_screen.dart';
import 'package:storeapp/screens/item_categories_screen.dart';
import 'package:storeapp/screens/navbar_screen.dart';
import 'package:storeapp/screens/update_product_screen.dart';

void main() {
  runApp(
    const StoreApp(),
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
