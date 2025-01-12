import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/shimmers/nearby_shimmer.dart';
import '../../../hooks/fetch_restaurants.dart';
import '../../../models/restaurants.dart';
import 'restaurant_card.dart';

class NearbyRestaurantCard extends HookWidget {
  const NearbyRestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants(code: "41007428");
    final List<RestaurantsModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return isLoading
        ? const NearbyShimmer()
        : Container(
            height: 190.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              primary: false,
              children: List.generate(restaurants!.length, (index) {
                var data = restaurants[index];
                return RestaurantCard(
                  title: data.title,
                  image: data.imageUrl,
                  logo: data.logoUrl,
                  time: data.time,
                  rating: data.ratingCount,
                  onTap: () {},
                );
              }),
            ),
          );
  }
}
