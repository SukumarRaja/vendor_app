import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';
import '../../../models/foods.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({super.key, required this.food});

  final FoodsModel food;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
                color: kOffWhite, borderRadius: BorderRadius.circular(9.r)),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.h,
                          child: Image.network(
                            food.imageUrl[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                              color: kGray.withOpacity(0.6),
                              height: 16.h,
                              width: 70.w,
                              child: RatingBarIndicator(
                                  rating: 5,
                                  itemCount: 5,
                                  itemSize: 15.h,
                                  itemBuilder: (context, i) {
                                    return const Icon(Icons.star,
                                        color: kSecondary);
                                  }),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: food.title,
                          style: appStyle(11, kDark, FontWeight.w400)),
                      ReusableText(
                          text: "Delivery time: ${food.time}",
                          style: appStyle(11, kGray, FontWeight.w400)),
                      SizedBox(
                        width: width * 0.7,
                        height: 15.h,
                        child: ListView.builder(
                            itemCount: food.additives.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, i) {
                              var data = food.additives[i];
                              return Container(
                                padding: EdgeInsets.all(2.h),
                                margin: EdgeInsets.only(right: 5.w),
                                decoration: BoxDecoration(
                                    color: kSecondaryLight,
                                    borderRadius: BorderRadius.circular(9.r)),
                                child: ReusableText(
                                    text: data.title,
                                    style: appStyle(8, kGray, FontWeight.w400)),
                              );
                            }),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
              alignment: Alignment.center,
              height: 19.h,
              width: 60.w,
              decoration: BoxDecoration(
                  color: kPrimary, borderRadius: BorderRadius.circular(10.r)),
              child: ReusableText(
                  text: "\u20B9 ${food.price.toStringAsFixed(2)}",
                  style: appStyle(12, kLightWhite, FontWeight.w600)),
            ),
          ),
          Positioned(
            right: 75.w,
            top: 6.h,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 19.h,
                width: 19.w,
                decoration: BoxDecoration(
                    color: kSecondary,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Icon(
                  MaterialCommunityIcons.cart_plus,
                  size: 15.h,
                  color: kLightWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
