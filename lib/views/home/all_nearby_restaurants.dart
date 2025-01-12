import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/app_style.dart';
import '../../common/background_container.dart';
import '../../common/reusable_text.dart';
import '../../common/shimmers/foodlist_shimmer.dart';
import '../../constants/constants.dart';
import '../../hooks/fetch_all_restaurants.dart';
import '../../models/restaurants.dart';
import 'widgets/restaurant_tile.dart';

class AllNearbyRestaurants extends HookWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants(code: "41007428");
    final List<RestaurantsModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: ReusableText(
            text: "Nearby Restaurants",
            style: appStyle(13, kLightWhite, FontWeight.w600)),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: isLoading
              ? const FoodsListShimmer()
              : ListView(
                  children: List.generate(restaurants!.length, (index) {
                    return RestaurantTile(restaurant: restaurants[index]);
                  }),
                ),
        ),
      ),
    );
  }
}
