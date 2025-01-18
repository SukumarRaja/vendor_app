import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/shimmers/foodlist_shimmer.dart';
import '../../../constants/constants.dart';
import '../../../controllers/category.dart';
import '../../../hooks/fetch_category_foods.dart';
import '../../../models/foods.dart';
import 'food_tile.dart';

class CategoryFoodsList extends HookWidget {
  const CategoryFoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategoryFoods(
        categoryId: "${CategoryController.to.category}", code: "41007428");
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return SizedBox(
      height: height,
      width: width,
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
    );
  }
}
