import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/app_style.dart';
import '../../common/background_container.dart';
import '../../common/reusable_text.dart';
import '../../common/shimmers/foodlist_shimmer.dart';
import '../../constants/constants.dart';
import '../../hooks/fetch_all_categories.dart';
import '../../models/categories.dart';
import 'category_page.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kOffWhite,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios)),
          title: ReusableText(
            text: "Categories",
            style: appStyle(14, kGray, FontWeight.w600),
          )),
      body: BackgroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : ListView(
                  children: List.generate(categories!.length, (index) {
                    var data = categories[index];
                    return ListTile(
                      onTap: () {
                        Get.to(() => CategoryPage(data),
                            transition: Transition.fadeIn,
                            duration: const Duration(milliseconds: 900));
                      },
                      leading: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: kGrayLight,
                        child: Image.network(
                          data.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: ReusableText(
                          text: data.title,
                          style: appStyle(12, kGray, FontWeight.normal)),
                      trailing: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: kGray,
                        size: 15.r,
                      ),
                    );
                  }),
                ),
        ),
      ),
    );
  }
}
