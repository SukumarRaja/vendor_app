import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:vendor_app/controllers/tab_index.dart';

import '../constants/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => Stack(
            children: [
              Container(
                height: height,
                width: width,
                color: kOffWhite,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                  data: Theme.of(context).copyWith(canvasColor: kPrimary),
                  child: BottomNavigationBar(
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
