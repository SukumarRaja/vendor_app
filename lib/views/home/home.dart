import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/custom_app_bar.dart';
import '../../common/custom_container.dart';
import '../../common/heading.dart';
import '../../constants/constants.dart';
import '../../controllers/category.dart';
import 'all_fastest_foods.dart';
import 'all_nearby_restaurants.dart';
import 'recommendations.dart';
import 'widgets/category_foods_list.dart';
import 'widgets/category_list.dart';
import 'widgets/food_list.dart';
import 'widgets/nearby_restaurant_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(130.h),
            child:const CustomAppBar()),
        body: SafeArea(
            child: CustomContainer(
                containerContent: Column(
          children: [
            const CategoryList(),
            Obx(() => CategoryController.to.title == ""
                ? Column(
                    children: [
                      Heading(
                          text: "Try Something New",
                          onTap: () {
                            Get.to(() => const Recommendations(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900));
                          }),
                      const FoodList(),
                      Heading(
                          text: "Nearby Restaurants",
                          onTap: () {
                            Get.to(() => const AllNearbyRestaurants(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900));
                          }),
                      const NearbyRestaurantCard(),
                      Heading(
                          text: "Fastest food closer to you",
                          onTap: () {
                            Get.to(() => const AllFastestFoods(),
                                transition: Transition.cupertino,
                                duration: const Duration(milliseconds: 900));
                          }),
                      const FoodList(),
                    ],
                  )
                : CustomContainer(
                    containerContent: Column(
                      children: [
                        Heading(
                            more: false,
                            text:
                                "Explore ${CategoryController.to.title} Category",
                            onTap: () {
                              Get.to(() => const Recommendations(),
                                  transition: Transition.cupertino,
                                  duration: const Duration(milliseconds: 900));
                            }),
                        CategoryFoodsList()
                      ],
                    ),
                  ))
          ],
        ))));
  }
}
