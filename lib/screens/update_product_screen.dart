import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/update_product.dart';
import 'package:storeapp/widgets/custom_button.dart';
import 'package:storeapp/widgets/custom_textfeild.dart';

// ignore: must_be_immutable
class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName;

  String? description;

  String? price;

  String? image;

  bool isLodaing = false;
  ProductModel? product2;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    product2 = product;
    TextEditingController controller = TextEditingController();

    return ModalProgressHUD(
      inAsyncCall: isLodaing,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Customtextfeild(
                  hintext: '${product2!.title}',
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Customtextfeild(
                  hintext: '${product2!.description}',
                  onChanged: (data) {
                    description = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Customtextfeild(
                    hintext: '${product2!.price}',
                    inputType: TextInputType.number,
                    onChanged: (data) {
                      price = data;
                    }),
                const SizedBox(
                  height: 15,
                ),
                Customtextfeild(
                  hintext: '${product2!.image}',
                  onChanged: (data) {
                    image = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  textbuttom: 'Update',
                  onTap: () async {
                    isLodaing = true;
                    setState(() {});
                    try {
                      await updateProduct();
                      print('Succses');
                    } catch (e) {
                      print(e.toString());
                    }
                    isLodaing = false;
                    setState(() {
                      controller.clear();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct() async {
    await UpdateProductService().updateProduct(
        id: product2!.id,
        title: productName == null ? product2!.title : productName!,
        price: price == null ? product2!.price.toString() : price!,
        description: description == null ? product2!.description : description!,
        image: image == null ? product2!.image : image!,
        category: product2!.category);
  }
}
