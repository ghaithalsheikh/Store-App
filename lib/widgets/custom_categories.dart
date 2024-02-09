import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCategories extends StatelessWidget {
  CustomCategories({super.key, required this.categoriey, this.onTap});

  String? categoriey;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            categoriey!,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
