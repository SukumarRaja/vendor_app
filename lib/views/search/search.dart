import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../../common/custom_container.dart';
import '../../common/custom_text_field.dart';
import '../../common/shimmers/foodlist_shimmer.dart';
import '../../constants/constants.dart';
import '../../controllers/search.dart';
import '../../models/foods.dart';
import 'loading_widget.dart';
import 'search_results.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
      appBar: AppBar(
        toolbarHeight: 74.h,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: CustomTextField(
            controller: _searchController,
            keyboardType: TextInputType.text,
            hintText: "Search For Foods",
            suffixIcon: GestureDetector(
                onTap: () {
                  if (SearchFoodController.to.searchResults.isEmpty) {
                    SearchFoodController.to
                        .searchFoods(key: _searchController.text);
                  } else {
                    SearchFoodController.to.searchResults = <FoodsModel>[];
                    _searchController.clear();
                  }
                },
                child: Obx(() => SearchFoodController.to.searchResults.isEmpty
                    ? Icon(Ionicons.search, color: kPrimary)
                    : Icon(Ionicons.close, color: kRed))),
          ),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
            color: Colors.white,
            containerContent: Obx(
              () => SearchFoodController.to.isLoading
                  ? FoodsListShimmer()
                  : SearchFoodController.to.searchResults.isEmpty
                      ? LoadingWidget()
                      : SearchResults(),
            )),
      ),
    );
  }
}
