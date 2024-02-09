import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CustomButton({this.onTap, required this.textbuttom});
  String? textbuttom;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 10, 96, 104),
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            textbuttom!,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
