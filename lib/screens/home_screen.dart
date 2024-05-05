import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/cubitGetAllProducts/get_all_product_cubit.dart';
import 'package:storeapp/screens/add_product_screen.dart';
import 'package:storeapp/screens/favourite_screen.dart';
import 'package:storeapp/widgets/custom_card.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
        child: BlocBuilder<GetAllProductCubit, GetAllProductState>(
          builder: (context, state) {
            if (state is GetAllProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetAllProductLoaded) {
              return GridView.builder(
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 80),
                  itemCount: state.products.length,
                  itemBuilder: ((context, index) {
                    return CustomCard(
                      product: state.products[index],
                    );
                  }));
            }
            return const SizedBox();
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
