import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class PriceAfterAndBeforeDiscount extends StatelessWidget {
  const PriceAfterAndBeforeDiscount({
    super.key,
    required this.priceAfterDiscount,
    required this.priceBeforeDiscount,
    this.details = false,
  });
  final String priceAfterDiscount;
  final String priceBeforeDiscount;
  final bool details;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return RichText(
      text: TextSpan(
        text: '$priceBeforeDiscount    ',
        style: details
            ? AppStyles.font18BoldBlackColor(context).copyWith(
              fontSize: isLandscape ? 12.sp : 18.sp,
            )
            : AppStyles.font14RegularDarkGreyColor(context).copyWith(
              fontSize: isLandscape ? 8.sp : 14.sp,
            ),
        children: [
          TextSpan(
            text: priceAfterDiscount,
            style: details
                ? AppStyles.font18RegularLightRedColorLineThrough(context).copyWith(
              fontSize: isLandscape ? 12.sp : 18.sp,
            )
                : AppStyles.font14RegularGreyColorLineThrough(context).copyWith(
              fontSize: isLandscape ? 8.sp : 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
