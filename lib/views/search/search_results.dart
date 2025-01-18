import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/search.dart';
import '../../models/foods.dart';
import '../home/widgets/food_tile.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SearchFoodController.to.isLoading
        ? const SizedBox.shrink()
        : Container(
            padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
            height: height,
            child: ListView.builder(
                itemCount: SearchFoodController.to.searchResults.length,
                itemBuilder: (context, index) {
                  FoodsModel food =
                      SearchFoodController.to.searchResults[index];
                  return FoodTile(food: food);
                }),
          ));
  }
}
