import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/uidata.dart';
import 'food_card.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        primary: false,
        children: List.generate(foods.length, (index) {
          var data = foods[index];
          return FoodCard(
            title: "${data['title']}",
            price: data['price'].toStringAsFixed(2),
            time: "${data['time']}",
            image: "${data['imageUrl']}",
            onTap: () {},
          );
        }),
      ),
    );
  }
}
