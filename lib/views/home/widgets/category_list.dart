import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app/controllers/category.dart';

import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../constants/constants.dart';
import '../../../constants/uidata.dart';
import '../../category/all_categories.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(categories.length, (index) {
          var data = categories[index];
          return GestureDetector(
            onTap: () {
              if (CategoryController.to.category == data['_id']) {
                CategoryController.to.category = "";
                CategoryController.to.title = "";
              } else if (data['title'] == "More") {
                Get.to(() => const AllCategories(),
                    transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 900));
              } else {
                CategoryController.to.category = data['_id'];
                CategoryController.to.title = data['title'];
              }
            },
            child: Obx(
              () => Container(
                margin: EdgeInsets.only(right: 5.w),
                padding: EdgeInsets.only(top: 4.h),
                width: width * 0.19,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                        color: CategoryController.to.category == data['_id']
                            ? kSecondary
                            : kOffWhite,
                        width: .5.w)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 35.h,
                      child: Image.network(
                        categories[index]['imageUrl'],
                        fit: BoxFit.contain,
                      ),
                    ),
                    ReusableText(
                        text: "${categories[index]['title']}",
                        style: appStyle(12, kDark, FontWeight.normal))
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
