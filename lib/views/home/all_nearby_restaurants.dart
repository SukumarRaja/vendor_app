import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app/common/background_container.dart';
import 'package:vendor_app/constants/uidata.dart';
import 'package:vendor_app/views/home/widgets/restaurant_tile.dart';

import '../../common/app_style.dart';
import '../../common/reusable_text.dart';
import '../../constants/constants.dart';

class AllNearbyRestaurants extends StatelessWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: ReusableText(
            text: "Nearby Restaurants",
            style: appStyle(13, kGray, FontWeight.w600)),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: ListView(
            children: List.generate(restaurants.length, (index) {
              return RestaurantTile(restaurant: restaurants[index]);
            }),
          ),
        ),
      ),
    );
  }
}
