import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/screens/categoreis_screen.dart';
import 'package:storeapp/screens/favourite_screen.dart';
import 'package:storeapp/screens/home_screen.dart';
import 'package:storeapp/screens/item_categories_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});
  static String id = 'navbar screen';
  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int currentIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    ItemCategories(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.teal[100],
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.cartShopping), label: 'MyCart'),
          ]),
    );
  }
}
