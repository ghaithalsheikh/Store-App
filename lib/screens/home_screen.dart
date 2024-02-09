import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/screens/add_product_screen.dart';
import 'package:storeapp/screens/favourite_screen.dart';
import 'package:storeapp/services/get_all_product.dart';
import 'package:storeapp/widgets/custom_card.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: const Text('New Trend'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: IconButton(
              icon: const Icon(FontAwesomeIcons.cartPlus),
              onPressed: () {
                Navigator.pushNamed(context, FavouriteScreen.id);
              },
            ),
            color: Colors.black,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 70),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductService().getallproduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddProductScreen.id);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
