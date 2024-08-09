import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
   CustomTextField({super.key, required this.labelText, required this.hintText, required this.prefixIcon, this.suffixIcon, required this.controller, this.obscure});

  String labelText;
  String hintText;
  IconData prefixIcon;
  IconData? suffixIcon;
  TextEditingController controller;

  bool? obscure = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure!,
      decoration: InputDecoration(
        label: Text(labelText),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        focusedBorder: const OutlineInputBorder(
          
          borderSide: BorderSide(
            color: Colors.blue,
          )
        )

      ),
    );
  }
}