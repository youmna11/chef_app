import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_color.dart';



TextStyle _textStyle({
  required Color color,
  required double fontSize,
  required FontWeight fontWeight,
}) {
  return TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
  );
}
TextStyle boldStyle({
  Color color = AppColors.white,
  double fontSize=24,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    );

TextStyle regularStyle({
  Color color = AppColors.white,
  double fontSize=24,
}) =>
    _textStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.normal,
    );

