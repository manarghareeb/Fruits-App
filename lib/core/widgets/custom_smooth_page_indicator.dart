import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomSmoothPageIndicator extends StatefulWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.count,
    required this.controller,
  });
  final int count;
  final PageController controller;

  @override
  State<CustomSmoothPageIndicator> createState() =>
      _CustomSmoothPageIndicatorState();
}

class _CustomSmoothPageIndicatorState extends State<CustomSmoothPageIndicator> {
  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return SmoothPageIndicator(
      controller: widget.controller,
      count: widget.count,
      effect: CustomizableEffect(
        spacing: 20,
        dotDecoration: DotDecoration(
          width: isLandscape ? 5.w : 10.w,
          height: isLandscape ? 5.w : 10.h,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50.r),
          dotBorder: DotBorder(color: AppColors.lightBlackColor),
        ),
        activeDotDecoration: DotDecoration(
          width: isLandscape ? 5.w : 10.w,
          height: isLandscape ? 5.w : 10.h,
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(50.r),
          dotBorder: DotBorder(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
