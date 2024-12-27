import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/uidata.dart';
import 'restaurant_card.dart';

class NearbyRestaurantCard extends StatelessWidget {
  const NearbyRestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        primary: false,
        children: List.generate(restaurants.length, (index) {
          var data = restaurants[index];
          return RestaurantCard(
            title: "${data['title']}",
            image: "${data['imageUrl']}",
            logo: "${data['logoUrl']}",
            time: "${data['time']}",
            rating: "${data['ratingCount']}",
            onTap: () {},
          );
        }),
      ),
    );
  }
}
