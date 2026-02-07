import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class ImageBannerSection extends StatelessWidget {
  const ImageBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    final isTablet = AppResponsive.isTablet(context);
    return Stack(
      children: [
        ClipRRect(
          child: Image.asset(
            width: 388.w,
            AppImages.productBanner,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: isLandscape ? isTablet ? 26 : 17 : 12,
          right: isLandscape ? isTablet ? 26 : 17 : 12,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 13.5.w, vertical: 6.5.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Text(
              '10% Off Discount',
              style: isLandscape ? AppStyles.font14RegularDarkGreyColor.copyWith(
                fontSize: 12.sp
              ) : AppStyles.font16RegularDarkGreyColor,
            ),
          ),
        ),
      ],
    );
  }
}
