import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/categories_service.dart';
import 'package:storeapp/widgets/custom_card.dart';

// ignore: must_be_immutable
class ItemCategories extends StatelessWidget {
  const ItemCategories({super.key});
  static String id = 'Item Categorey';
  @override
  Widget build(BuildContext context) {
    String categoryName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text('New Trend'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(FontAwesomeIcons.cartPlus),
              color: Colors.black,
            )
          ]),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 70),
          child: FutureBuilder<List<ProductModel>>(
            future: CategoriesService()
                .getcategoriesProduct(categoryName: categoryName),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            childAspectRatio: 1.5,
                            mainAxisSpacing: 80),
                    itemCount: products.length,
                    itemBuilder: ((context, index) {
                      return CustomCard(
                        product: products[index],
                      );
                    }));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
