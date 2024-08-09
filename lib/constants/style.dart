import 'package:eco_app/constants/colors.dart';
import 'package:flutter/material.dart';


const TextStyle textstyle1 = TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.bold);
const TextStyle textstyle2 = TextStyle(color: textColor, fontSize: 12);

const TextStyle appBarStyle = TextStyle(color: Colors.deepOrange, fontSize: 20, fontWeight: FontWeight.bold);

 TextStyle titleStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  foreground: Paint()
    ..shader = const LinearGradient(
      colors: <Color>[
        Colors.red,
        Colors.blue,
      ],
      ).createShader(
        const Rect.fromLTRB(0.0, 0.0, 200.0, 70.0),
      ),
);