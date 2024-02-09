import 'package:flutter/material.dart';
import 'package:storeapp/widgets/custom_card.dart';

// ignore: must_be_immutable
class FavouriteScreen extends StatefulWidget {
  static String id = 'Favourite screen';

  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.teal[100],
        ),
        body: productfav.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.only(top: 50),
                child: ListView.builder(
                  itemCount: productfav.length,
                  itemBuilder: (context, index) {
                    final product = productfav[index];
                    return Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: CustomCard(
                          product: product,
                          icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  productfav
                                      .removeWhere((item) => item == product);
                                });
                              },
                              icon: const Icon(Icons.remove_circle)),
                        ));
                  },
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'your cart is empty',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ));
  }
}
