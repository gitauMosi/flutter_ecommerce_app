import 'package:eco_app/constants/style.dart';
import 'package:flutter/material.dart';

class NotifacationPage extends StatelessWidget {
  const NotifacationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifacation", style: appBarStyle,),
        ),
      body: const Center(
        child: Text('No Notifacation!',
         style: TextStyle(
           fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}