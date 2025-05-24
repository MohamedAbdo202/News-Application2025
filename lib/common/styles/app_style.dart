import 'package:flutter/material.dart';
import 'package:news/util/app_constants/app_colors.dart';
import 'package:news/util/app_constants/app_font_sizes.dart';

abstract class Styles {
  ///White Styles
  static TextStyle whiteColorStyle18 = TextStyle(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSizes.fontSize18);

  static TextStyle whiteColorStyle13 = TextStyle(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSizes.fontSize13);

  /// Black Styles
  static TextStyle blackColorStyle12 = TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSizes.fontSize12);

  static TextStyle blackColorStyle13 = TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSizes.fontSize13);
  static TextStyle blackColorStyle15 = TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSizes.fontSize15);
  static TextStyle blackColorStyle17 = TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSizes.fontSize17);
  static TextStyle blackColorStyle24 = TextStyle(
      color: AppColors.blackColor,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSizes.fontSize24);
}
