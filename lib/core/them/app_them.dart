import 'package:flutter/material.dart';
import '../utils/app_color.dart';
import '../utils/app_text_style.dart';

ThemeData getAppTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
      ),
      textTheme: TextTheme(
        displayLarge: boldStyle(),
        displayMedium: regularStyle(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),

        hintStyle: boldStyle(color: AppColors.grey, fontSize: 16),

        //fill color
        // fillColor: AppColors.lightBlack,
        // filled: true,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            AppColors.grey,
          ),
          textStyle: MaterialStateProperty.all(
              boldStyle(color: AppColors.grey, fontSize: 16)),
        ),
      ));
}
