import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/app_style.dart';
import '../../common/background_container.dart';
import '../../common/reusable_text.dart';
import '../../common/shimmers/foodlist_shimmer.dart';
import '../../constants/constants.dart';
import '../../hooks/fetch_all_foods.dart';
import '../../models/foods.dart';
import 'widgets/food_tile.dart';

class Recommendations extends HookWidget {
  const Recommendations({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllFoods(code: "41007428");
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
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
            text: "Recommendations",
            style: appStyle(13, kLightWhite, FontWeight.w600)),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.all(12.h),
                child: ListView(
                  children: List.generate(foods!.length, (index) {
                    return FoodTile(food: foods[index]);
                  }),
                ),
              ),
      ),
    );
  }
}
