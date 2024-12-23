import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../controllers/tab_index.dart';
import 'cart.dart';
import 'home.dart';
import 'profile.dart';
import 'search.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pages = [
    const Home(),
    const Search(),
    const Cart(),
    const Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              pages[TabIndexController.to.tabIndex],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(context).copyWith(canvasColor: kPrimary),
                  child: BottomNavigationBar(
                      elevation: 0,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      unselectedIconTheme: const IconThemeData(color: Colors.black38),
                      selectedIconTheme: const IconThemeData(color: kSecondary),
                      onTap: (value) {
                        TabIndexController.to.tabIndex = value;
                      },
                      currentIndex: TabIndexController.to.tabIndex,
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(AntDesign.appstore1), label: "Home"),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: "Search"),
                        BottomNavigationBarItem(
                            icon: Badge(
                                label: Text("1"),
                                child: Icon(FontAwesome.opencart)),
                            label: "Cart"),
                        BottomNavigationBarItem(
                            icon: Icon(FontAwesome.user_circle),
                            label: "Profile"),
                      ]),
                ),
              )
            ],
          )),
    );
  }
}
