import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_app/common/values/app_color.dart';

Widget reusableText(String text,
    {Color color = AppColors.primaryText,
    double fontSize = 16,
    fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style:
        TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize.sp),
  );
}
