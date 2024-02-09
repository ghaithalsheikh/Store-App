import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Customtextfeild extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  Customtextfeild({this.onChanged, this.hintext, this.inputType});
  String? hintext;
  Function(String)? onChanged;
  TextInputType? inputType;

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
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
