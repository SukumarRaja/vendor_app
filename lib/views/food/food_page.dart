import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:vendor_app/common/app_style.dart';
import 'package:vendor_app/common/custom_button.dart';
import 'package:vendor_app/common/custom_text_field.dart';
import 'package:vendor_app/common/reusable_text.dart';
import 'package:vendor_app/controllers/food.dart';
import 'package:vendor_app/views/auth/phone_verification_page.dart';

import '../../constants/constants.dart';
import '../../hooks/fetch_restaurant.dart';
import '../../models/foods.dart';
import '../restaurant/restaurant_page.dart';

class FoodPage extends StatefulHookWidget {
  const FoodPage({super.key, required this.food});

  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final TextEditingController _preferences = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurant(code: widget.food.restaurant);
    return Scaffold(
      body: Column(
        // physics: NeverScrollableScrollPhysics(),
        // padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.r)),
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
                      children: List.generate(widget.food.imageUrl.length, (i) {
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
                ),
                Positioned(
                  top: 40.h,
                  left: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Ionicons.chevron_back_circle,
                        color: kPrimary, size: 30),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 12.w,
                  child: CustomButton(
                    btnWidth: 100.w,
                    text: "Open Restaurant",
                    onTap: () {
                      Get.to(() => RestaurantPage(
                            restaurant: hookResult.data,
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                          text: widget.food.title,
                          style: appStyle(18, kDark, FontWeight.w600)),
                      Obx(() => ReusableText(
                          text:
                              "\u20B9 ${widget.food.price * FoodController.to.count}",
                          style: appStyle(18, kPrimary, FontWeight.w600))),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    widget.food.description,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    style: appStyle(11, kGray, FontWeight.w400),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 18.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(widget.food.foodTags.length, (i) {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          margin: EdgeInsets.only(right: 6.w),
                          decoration: BoxDecoration(
                              color: kPrimary,
                              borderRadius: BorderRadius.circular(15.r)),
                          child: ReusableText(
                              text: widget.food.foodTags[i],
                              style: appStyle(11, kWhite, FontWeight.w400)),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  ReusableText(
                      text: "Additives and Toppings",
                      style: appStyle(18, kDark, FontWeight.w600)),
                  SizedBox(height: 10.h),
                  Column(
                    children: List.generate(widget.food.additives.length, (i) {
                      var additive = widget.food.additives[i];
                      return CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          dense: true,
                          activeColor: kSecondary,
                          value: false,
                          tristate: false,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                  text: additive.title,
                                  style: appStyle(12, kDark, FontWeight.w400)),
                              ReusableText(
                                  text: "\u20B9 ${additive.price}",
                                  style:
                                      appStyle(12, kPrimary, FontWeight.w600)),
                            ],
                          ),
                          onChanged: (data) {});
                    }),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                          text: "Quantity",
                          style: appStyle(18, kDark, FontWeight.w600)),
                      SizedBox(width: 5.w),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                FoodController.to.increment();
                              },
                              child: const Icon(AntDesign.pluscircleo)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Obx(() => ReusableText(
                                text: "${FoodController.to.count}",
                                style: appStyle(14, kDark, FontWeight.w600))),
                          ),
                          GestureDetector(
                              onTap: () {
                                FoodController.to.decrement();
                              },
                              child: const Icon(AntDesign.minuscircleo)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20.h),
                  ReusableText(
                      text: "Preferences",
                      style: appStyle(18, kDark, FontWeight.w600)),
                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 65.h,
                    child: CustomTextField(
                      controller: _preferences,
                      hintText: "Add a note with your preference",
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: 40.h,
                    padding: EdgeInsets.only(left: 12.w),
                    decoration: BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.circular(30.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showVerificationSheet(context);
                          },
                          child: ReusableText(
                              text: "Place Order",
                              style:
                                  appStyle(18, kLightWhite, FontWeight.w600)),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                              backgroundColor: kSecondary,
                              radius: 20.r,
                              child: Icon(Ionicons.cart, color: kLightWhite)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  showVerificationSheet(context) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        showDragHandle: true,
        builder: (_) {
          return Container(
            height: 560.h,
            decoration: BoxDecoration(
                color: kLightWhite,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.r),
                    topLeft: Radius.circular(30.r)),
                image: DecorationImage(
                    image: AssetImage('assets/images/restaurant_bk.png'),
                    fit: BoxFit.fill)),
            child: Padding(
              padding: EdgeInsets.all(8.h),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  ReusableText(
                      text: "Verify Your Phone Number",
                      style: appStyle(18, kPrimary, FontWeight.w600)),
                  SizedBox(
                    height: 250.h,
                    child: Column(
                      children: List.generate(verificationReasons.length, (i) {
                        return ListTile(
                          leading: Icon(
                            Icons.check_circle_outlined,
                            color: kPrimary,
                          ),
                          title: Text(
                            verificationReasons[i],
                            textAlign: TextAlign.justify,
                            style: appStyle(11, kGrayLight, FontWeight.normal),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    text: "Verify Phone Number",
                    btnHeight: 35.h,
                    onTap: () {
                      Get.to(() => PhoneVerificationPage());
                    },
                  )
                ],
              ),
            ),
          );
        });
  }
}
