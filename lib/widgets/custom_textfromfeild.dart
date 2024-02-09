import 'package:flutter/material.dart';

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild(
      {super.key, this.onChanged, this.hintext, this.inputType});
  final String? hintext;
  final Function(String)? onChanged;
  final TextInputType? inputType;

  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (data) {
          if (data == null || data.isEmpty) {
            return "Feild is required";
          }
          return null;
        },
        controller: controller,
        keyboardType: inputType,
        style: const TextStyle(fontSize: 20),
        cursorColor: Colors.black,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
          ),
          hintText: hintext,
          hintStyle: const TextStyle(fontSize: 15),
        ));
  }
}
