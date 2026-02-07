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
            ? isLandscape ? AppStyles.font14RegularBlackColor : AppStyles.font18BoldBlackColor
            : isLandscape ? AppStyles.font14RegularBlackColor.copyWith(
              fontSize: 10.sp
            ) : AppStyles.font14RegularDarkGreyColor,
        children: [
          TextSpan(
            text: priceAfterDiscount,
            style: details
                ? isLandscape ? AppStyles.font18RegularLightRedColorLineThrough.copyWith(fontSize: 14.sp) : AppStyles.font18RegularLightRedColorLineThrough
                : isLandscape ? AppStyles.font14RegularGreyColorLineThrough.copyWith(fontSize: 10.sp) : AppStyles.font14RegularGreyColorLineThrough,
          ),
        ],
      ),
    );
  }
}
