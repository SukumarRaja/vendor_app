import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor_app/models/categories.dart';

import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../../../common/shimmers/categories_shimmer.dart';
import '../../../constants/constants.dart';
import '../../../controllers/category.dart';
import '../../../hooks/fetch_categories.dart';
import '../../category/all_categories.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoriesModel>? categoryList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;
    return Container(
      height: 75.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const CategoriesShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categoryList!.length, (index) {
                CategoriesModel data = categoryList[index];
                return GestureDetector(
                  onTap: () {
                    if (CategoryController.to.category == data.id) {
                      CategoryController.to.category = "";
                      CategoryController.to.title = "";
                    } else if (data.title == "More") {
                      Get.to(() => const AllCategories(),
                          transition: Transition.fadeIn,
                    duration: const Duration(milliseconds: 900));
              } else {
                      CategoryController.to.category = data.id;
                      CategoryController.to.title = data.title;
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
                              color: CategoryController.to.category == data.id
                                  ? kSecondary
                                  : kOffWhite,
                        width: .5.w)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 35.h,
                      child: Image.network(
                              data.imageUrl,
                              fit: BoxFit.contain,
                            ),
                    ),
                    ReusableText(
                              text: data.title,
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
