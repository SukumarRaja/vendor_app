// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';
import '../../../models/restaurants.dart';
import '../../restaurant/restaurant_page.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({super.key, required this.restaurant});

  final RestaurantsModel restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => RestaurantPage(restaurant: restaurant));
      },
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
                            restaurant.imageUrl,
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
                                    return const Icon(Icons.star, color: kSecondary);
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
                          text: restaurant.title,
                          style: appStyle(11, kDark, FontWeight.w400)),
                      ReusableText(
                          text: "Delivery time: ${restaurant.time}",
                          style: appStyle(11, kGray, FontWeight.w400)),
                      SizedBox(
                        width: width * 0.7,
                        child: ReusableText(
                            text: restaurant.coords.address,
                            overflow: TextOverflow.ellipsis,
                            style: appStyle(9, kGray, FontWeight.w400)),
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
                  color: restaurant.isAvailable == true ||
                          restaurant.isAvailable == null
                      ? kPrimary
                      : kSecondaryLight,
                  borderRadius: BorderRadius.circular(10.r)),
              child: ReusableText(
                  text: restaurant.isAvailable == true ||
                          restaurant.isAvailable == null
                      ? "Open"
                      : "Closed",
                  style: appStyle(12, kLightWhite, FontWeight.w600)),
            ),
          )
        ],
      ),
    );
  }
}
