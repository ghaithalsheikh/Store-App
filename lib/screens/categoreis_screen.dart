import 'package:flutter/material.dart';
import 'package:storeapp/screens/item_categories_screen.dart';
import 'package:storeapp/services/get_all_categories.dart';
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
      body: FutureBuilder<List<dynamic>>(
          future: AllCategoriesService().getallcategories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> categories = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.only(top: 40),
                child: GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 20),
                  itemCount: categories.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomCategories(
                          categoriey: categories[index],
                          onTap: () {
                            if (index == 0) {
                              Navigator.pushNamed(context, ItemCategories.id,
                                  arguments: categories[index]);
                            } else if (index == 1) {
                              Navigator.pushNamed(context, ItemCategories.id,
                                  arguments: categories[index]);
                            } else if (index == 2) {
                              Navigator.pushNamed(context, ItemCategories.id,
                                  arguments: categories[index]);
                            } else if (index == 3) {
                              Navigator.pushNamed(context, ItemCategories.id,
                                  arguments: categories[index]);
                            }
                          },
                        ));
                  }),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
