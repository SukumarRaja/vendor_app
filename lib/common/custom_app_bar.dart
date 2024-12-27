import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';
import 'app_style.dart';
import 'reusable_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      height: 110.h,
      width: width,
      color: kOffWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundColor: kSecondary,
              backgroundImage: const NetworkImage(
                  'https://www.shutterstock.com/image-photo/business-woman-confident-smart-teacher-260nw-1842925690.jpg'),
            ),
            const SizedBox(width: 15),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableText(
                      text: "Deliver to",
                      style: appStyle(13, kSecondary, FontWeight.w600)),
                  Text(
                    "1768 21st Ave N, Plymouth, MN 55447",
                    overflow: TextOverflow.ellipsis,
                    style: appStyle(11, kGrayLight, FontWeight.normal),
                  )
                ],
              ),
            ),
            const Spacer(),
            Text(
              getTimeOfDay(),
              style: const TextStyle(fontSize: 35),
            )
          ],
        ),
      ),
    );
  }

  getTimeOfDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      return ' 🌅 ';
    } else if (hour >= 12 && hour < 16) {
      return ' 🌦️ ';
    } else {
      return ' 🌙 ';
    }
  }
}
