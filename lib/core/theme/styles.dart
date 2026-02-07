import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class AppStyles {
  static double adaptiveFontSize(BuildContext context, double baseSize) {
    final isLandscape = AppResponsive.isLandscape(context);
    return isLandscape ? (baseSize - 4).sp : baseSize.sp;
  }

  static TextStyle font12SemiBoldWhiteColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 12),
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle font14RegularGreyColorLineThrough(BuildContext context) =>
      TextStyle(
        fontSize: adaptiveFontSize(context, 14),
        fontWeight: FontWeight.normal,
        color: AppColors.greyColor,
        fontFamily: 'Titillium Web',
        decoration: TextDecoration.lineThrough,
        decorationColor: AppColors.greyColor,
      );

  static TextStyle font14RegularDarkGreyColor(BuildContext context) =>
      TextStyle(
        fontSize: adaptiveFontSize(context, 14),
        fontWeight: FontWeight.normal,
        color: AppColors.lightBlackColor,
        fontFamily: 'Arial',
      );

  static TextStyle font14RegularGreyColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 14),
    fontWeight: FontWeight.normal,
    color: AppColors.greyColor,
    fontFamily: 'Arial',
  );

  static TextStyle font14RegularBlackColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 14),
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Arial',
  );

  static TextStyle font16RegularDarkGreyColor(BuildContext context) =>
      TextStyle(
        fontSize: adaptiveFontSize(context, 16),
        fontWeight: FontWeight.normal,
        color: AppColors.darkGreyColor,
        fontFamily: 'Titillium Web',
      );

  static TextStyle font16BoldBlackColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 16),
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
    fontFamily: 'Titillium Web',
  );

  static TextStyle font16BoldPrimaryColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 16),
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
    fontFamily: 'Titillium Web',
  );

  static TextStyle font18RegularLightRedColorLineThrough(
    BuildContext context,
  ) => TextStyle(
    fontSize: adaptiveFontSize(context, 18),
    fontWeight: FontWeight.normal,
    color: AppColors.lightRedColor,
    fontFamily: 'Titillium Web',
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.lightRedColor,
  );

  static TextStyle font18BoldWhiteColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 18),
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Arial',
  );

  static TextStyle font18BoldBlackColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 18),
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
    fontFamily: 'Titillium Web',
  );

  static TextStyle font18RegularBlackColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 18),
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Arial',
  );

  static TextStyle font18RegularDarkGreyColor(BuildContext context) =>
      TextStyle(
        fontSize: adaptiveFontSize(context, 18),
        fontWeight: FontWeight.normal,
        color: AppColors.darkGreyColor,
        fontFamily: 'Titillium Web',
      );

  static TextStyle font18RegularBlueColorUnderline(BuildContext context) =>
      TextStyle(
        fontSize: adaptiveFontSize(context, 18),
        fontWeight: FontWeight.normal,
        color: AppColors.blueColor,
        fontFamily: 'Arial',
        decoration: TextDecoration.underline,
        decorationColor: AppColors.blueColor,
      );

  static TextStyle font18RegularGreyColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 18),
    fontWeight: FontWeight.normal,
    color: AppColors.greyColor,
    fontFamily: 'Arial',
  );

  static TextStyle font24BoldPrimaryColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 24),
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
    fontFamily: 'Poppins',
  );

  static TextStyle font24RegularBlackColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 24),
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Arial',
  );

  static TextStyle font28BoldBlackColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 28),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Segoe UI',
  );

  static TextStyle font42BoldPrimaryColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 42),
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
    fontFamily: 'Arial',
  );

  // News
  static TextStyle font16RegularBlueColorUnderline(BuildContext context) =>
      TextStyle(
        fontSize: adaptiveFontSize(context, 16),
        fontWeight: FontWeight.normal,
        color: AppColors.blueColor,
        fontFamily: 'Arial',
        decoration: TextDecoration.underline,
        decorationColor: AppColors.blueColor,
      );

  static TextStyle font16RegularGreyColor(BuildContext context) => TextStyle(
    fontSize: adaptiveFontSize(context, 18),
    fontWeight: FontWeight.normal,
    color: AppColors.greyColor,
    fontFamily: 'Arial',
  );
}
