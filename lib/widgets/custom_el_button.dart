import 'package:eco_app/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({super.key, required this.text, required this.function});
   
   String text;
   Function() function;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        elevation: 0,
        foregroundColor: btnTextColor,
      ),
      onPressed: function,
       child: Text(text),
       
       );
       
  }
}