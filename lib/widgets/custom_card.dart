import 'package:flutter/material.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/screens/update_product_screen.dart';

List<ProductModel> productfav = [];

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.product, this.icon});

  final ProductModel product;
  final Widget? icon;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool? changeicon = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, UpdateProductScreen.id,
            arguments: widget.product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 50,
                    spreadRadius: 0,
                    offset: const Offset(10, 10)),
              ],
            ),
            child: Card(
              color: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.product.title.substring(0, 7),
                        style: const TextStyle(fontSize: 18)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$' '${widget.product.price}',
                            style: const TextStyle(fontSize: 18)),
                        Row(
                          children: [
                            changeicon == true
                                ? IconButton(
                                    icon: const Icon(
                                        Icons.favorite_border_outlined),
                                    onPressed: () {
                                      setState(() {
                                        productfav.add(widget.product);
                                        changeicon = false;
                                      });
                                    },
                                    color: Colors.red,
                                  )
                                : IconButton(
                                    icon: const Icon(Icons.favorite),
                                    onPressed: () {
                                      setState(() {
                                        productfav.remove(widget.product);
                                        changeicon = true;
                                      });
                                    },
                                    color: Colors.red,
                                  ),
                            widget.icon ?? Container(),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: -60,
            child: Image.network(
              widget.product.image,
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
