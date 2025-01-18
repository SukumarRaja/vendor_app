import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app/controllers/food.dart';

import '../../constants/constants.dart';
import '../../models/foods.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key, required this.food});

  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30.r)),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 230.h,
                      child: PageView.builder(
                          itemCount: widget.food.imageUrl.length,
                          onPageChanged: (page) {
                            FoodController.to.currentPage = page;
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              width: width,
                              height: 230.h,
                              color: kLightWhite,
                              child: CachedNetworkImage(
                                imageUrl: widget.food.imageUrl[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 0,
                      left: 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              List.generate(widget.food.imageUrl.length, (i) {
                            return Obx(() => Container(
                                  margin: EdgeInsets.all(4.h),
                                  width: 10.w,
                                  height: 10.h,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: FoodController.to.currentPage == i
                                        ? kSecondary
                                        : kGrayLight,
                                  ),
                                ));
                          })),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
