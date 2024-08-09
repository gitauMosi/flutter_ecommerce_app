import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBtmNavBar extends StatelessWidget {
   CustomBtmNavBar({super.key, required this.currentIndex});
   
  int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,   
      items: [
        _btmNavigationItem(Icons.home, "Home"),
        _btmNavigationItem(Icons.home, "explore"),
        _btmNavigationItem(Icons.shopping_cart_checkout, "Cart"),
        _btmNavigationItem(Icons.person_2_outlined, "Profile"),
      ]);
  }

  BottomNavigationBarItem _btmNavigationItem(IconData icon, String label){
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
      );
  }
}