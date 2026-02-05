import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';

class AppStyles {
  static TextStyle font12SemiBoldWhiteColor = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontFamily: 'Titillium Web',
  );

  static TextStyle font14RegularGreyColorLineThrough = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.greyColor,
    fontFamily: 'Titillium Web',
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.greyColor,
  );

  static TextStyle font14RegularDarkGreyColor = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.lightBlackColor,
    fontFamily: 'Arial',
  );

  static TextStyle font14RegularGreyColor = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.greyColor,
    fontFamily: 'Arial',
  );

  static TextStyle font14RegularBlackColor = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Arial',
  );

  static TextStyle font16RegularDarkGreyColor = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGreyColor,
    fontFamily: 'Titillium Web',
  );

  static TextStyle font16BoldBlackColor = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
    fontFamily: 'Titillium Web',
  );

  static TextStyle font16BoldPrimaryColor = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
    fontFamily: 'Titillium Web',
  );

  static TextStyle font18RegularLightRedColorLineThrough = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.lightRedColor,
    fontFamily: 'Titillium Web',
    decoration: TextDecoration.lineThrough,
    decorationColor: AppColors.lightRedColor,
  );

  static TextStyle font18BoldWhiteColor = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontFamily: 'Arial',
  );

  static TextStyle font18BoldBlackColor = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor,
    fontFamily: 'Titillium Web',
  );

  static TextStyle font18RegularBlackColor = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Arial',
  );

  static TextStyle font18RegularDarkGreyColor = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.darkGreyColor,
    fontFamily: 'Titillium Web',
  );

  static TextStyle font18RegularBlueColorUnderline = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.blueColor,
    fontFamily: 'Arial',
    decoration: TextDecoration.underline,
    decorationColor: AppColors.blueColor,
  );

  static TextStyle font18RegularGreyColor = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.greyColor,
    fontFamily: 'Arial',
  );

  static TextStyle font24BoldPrinaryColor = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
    fontFamily: 'Poppins',
  );

  static TextStyle font24RegularBlackColor = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    fontFamily: 'Arial',
  );

  static TextStyle font28BoldBlackColor = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: 'Segoe UI',
  );

  static TextStyle font42BoldPrimaryColor = TextStyle(
    fontSize: 42.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
    fontFamily: 'Arial',
  );
}
