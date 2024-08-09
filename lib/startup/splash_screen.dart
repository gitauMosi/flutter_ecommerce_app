import 'package:eco_app/constants/colors.dart';
import 'package:eco_app/constants/text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Text(welcomeText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
      ),
    );
  }
}