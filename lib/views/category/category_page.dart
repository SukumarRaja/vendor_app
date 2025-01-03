import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/constants/constants.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kOffWhite,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: const Text("Category Page"),
      ),
      body: const Center(child: Text("Category")),
    );
  }
}
