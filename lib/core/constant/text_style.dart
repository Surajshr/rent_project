import 'package:flutter/material.dart';
import 'package:rent_project/core/constant/app_colors.dart';

class AppTextStyle {
  static const TextStyle bodyTextStyle = TextStyle(
      color: AppColors.bodyTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 16.0);
  static const TextStyle headingTextStyle = TextStyle(
      color: AppColors.bodyTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 20.0);

  static const TextStyle dropDownTextStyle = TextStyle(
    color: AppColors.appThemeColor,
    fontWeight: FontWeight.bold
  );
  static const TextStyle boldText = TextStyle(
    fontWeight: FontWeight.bold,
  );
}
