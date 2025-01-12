import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor_app/common/shimmers/nearby_shimmer.dart';

import '../../../common/shimmers/foodlist_shimmer.dart';
import '../../../hooks/fetch_foods.dart';
import '../../../models/foods.dart';
import 'food_card.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoods(code: "41007428");
    List<FoodsModel>? foods = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return Container(
      height: 175.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              primary: false,
              children: List.generate(foods!.length, (index) {
                var data = foods[index];
                return FoodCard(
                  title: data.title,
                  price: data.price.toStringAsFixed(2),
                  time: data.time,
                  image: data.imageUrl[0],
                  onTap: () {},
                );
              }),
            ),
    );
  }
}
