import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/constants.dart';
import 'app_style.dart';
import 'reusable_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      this.btnWidth,
      this.btnHeight,
      this.btnColor,
      this.radius,
      required this.text});

  final Function()? onTap;
  final double? btnWidth;
  final double? btnHeight;
  final double? radius;
  final Color? btnColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: btnHeight ?? 28.h,
        width: btnWidth ?? width,
        decoration: BoxDecoration(
            color: btnColor ?? kPrimary,
            borderRadius: BorderRadius.circular(radius ?? 9.r)),
        child: ReusableText(
            text: text, style: appStyle(12, kLightWhite, FontWeight.w500)),
      ),
    );
  }
}
