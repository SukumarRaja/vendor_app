import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app/common/app_style.dart';
import 'package:vendor_app/common/background_container.dart';
import 'package:vendor_app/common/reusable_text.dart';
import 'package:vendor_app/constants/constants.dart';

import '../../common/shimmers/foodlist_shimmer.dart';
import '../../hooks/fetch_category_foods.dart';
import '../../models/foods.dart';
import '../home/widgets/food_tile.dart';

class CategoryPage extends HookWidget {
  const CategoryPage(this.data, {super.key});

  final dynamic data;
  @override
  Widget build(BuildContext context) {
    final hookResult =
        useFetchCategoryFoods(categoryId: "${data.id}", code: "41007428");
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
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
        title: ReusableText(
          text: "${data.title} Category",
          style: appStyle(13, kGray, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
          color: Colors.white,
          child: SizedBox(
            height: height,
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
          )),
    );
  }
}
