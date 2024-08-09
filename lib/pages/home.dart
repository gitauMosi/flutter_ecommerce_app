import 'package:eco_app/constants/colors.dart';
import 'package:eco_app/constants/style.dart';
import 'package:eco_app/pages/home_pages/cart_body.dart';
import 'package:eco_app/pages/home_pages/explore_body.dart';
import 'package:eco_app/pages/home_pages/home_body.dart';
import 'package:eco_app/pages/home_pages/profile.dart';
import 'package:eco_app/pages/notifacation_page.dart';
import 'package:eco_app/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //static final Productcontroller _productcontroller = Productcontroller();
  int selectedItemIndex = 0;
  final List<Widget> pages = [
    const HomeBody(),
     CartBody(),
    const ExploreBody(),
    const ProfileBody(),
  ];

  void searchMethod() {
    //navigate to search
  }

  void onItemSelected(int index) {
    setState(() {
      selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    String title = 'E-Trade';
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // backgroundColor: appBarColor.withOpacity(0.3),
        elevation: 0,
        title:  Text(
          selectedItemIndex == 2 ? "Explore " : title,
          style: selectedItemIndex == 2 ? appBarStyle :titleStyle,
        ),
        actions: <Widget>[
        if(selectedItemIndex == 0 || selectedItemIndex == 1)
          GestureDetector(
            onTap: (){
              Get.to(()=>const SearchPage());
            },
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.search,
                color: iconColor,
                size: 18,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              if(selectedItemIndex == 2 ){
                Get.to(()=>const SearchPage());
              }else {
                Get.to(()=>const NotifacationPage());
              }
            },
            child:  Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                selectedItemIndex == 2 ? Icons.search : Icons.notifications,
                color: iconColor,
                size: 25,
              ),
            ),
          ),

        if(selectedItemIndex == 0 || selectedItemIndex == 1)
          GestureDetector(
            onTap: searchMethod,
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.shopping_bag_outlined,
                color: iconColor,
                size: 18,
              ),
            ),
          ),
        ],
      ),
      body: pages.elementAt(selectedItemIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12,
        unselectedFontSize: 10,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedItemIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        onTap: onItemSelected,
        items: [
          customNavItem(Icons.home, "Home"),
          customNavItem(Icons.shopping_cart_outlined, "Cart"),
          customNavItem(Icons.explore, "Explore"),
          customNavItem(Icons.person, "Profile"),
        ],
      ),
    );
  }

  BottomNavigationBarItem customNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
