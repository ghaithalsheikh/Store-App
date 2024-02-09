import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/services/add_product.dart';
import 'package:storeapp/widgets/custom_button.dart';
import 'package:storeapp/widgets/custom_textfromfeild.dart';

// ignore: must_be_immutable
class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});
  static String id = 'add product';

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  String? productName;

  String? description;

  String? price;

  String? image;

  String? category;

  bool isLodaing = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return ModalProgressHUD(
      inAsyncCall: isLodaing,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Product',
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CustomTextFormFeild(
                    hintext: 'Product Name',
                    onChanged: (data) {
                      productName = data;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormFeild(
                    hintext: 'discription',
                    onChanged: (data) {
                      description = data;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormFeild(
                      hintext: 'price',
                      inputType: TextInputType.number,
                      onChanged: (data) {
                        price = data;
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormFeild(
                    hintext: 'image',
                    onChanged: (data) {
                      image = data;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormFeild(
                    hintext: 'Category',
                    onChanged: (data) {
                      category = data;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    textbuttom: 'Update',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLodaing = true;
                        setState(() {});
                        try {
                          await addProduct();
                          print('Succses');
                        } catch (e) {
                          print(e.toString());
                        }
                        isLodaing = false;
                        setState(() {
                          controller.clear();
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addProduct() async {
    await AddProductService().addProduct(
        title: productName!,
        price: price.toString(),
        description: description!,
        image: image!,
        category: category!);
  }
}
