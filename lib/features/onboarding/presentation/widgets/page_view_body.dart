import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class PageViewBody extends StatelessWidget {
  const PageViewBody({super.key, required this.page});

  final Map<String, String> page;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    final isTablet = AppResponsive.isTablet(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: isLandscape ? 20.h : 60.h),
          SizedBox(
            width: isTablet ? 370.w : 275.w,
            height: isLandscape
                ? isTablet
                      ? 370.h
                      : 170.h
                : 273.h,
            child: Image.asset(AppImages.onboarding, fit: BoxFit.contain),
          ),
          SizedBox(height: isLandscape ? 16.h : 30.h),
          Text(
            page['title']!,
            textAlign: TextAlign.center,
            style: isLandscape
                ? AppStyles.font28BoldBlackColor(context).copyWith(
                    fontSize: AppStyles.adaptiveFontSize(
                      context,
                      isTablet ? 20 : 13,
                    ),
                  )
                : AppStyles.font28BoldBlackColor(context),
          ),
          SizedBox(height: isLandscape ? 12.h : 17.h),
          Text(
            page['subtitle']!,
            textAlign: TextAlign.center,
            style: isLandscape
                ? AppStyles.font14RegularGreyColor(context).copyWith(
                    fontSize: AppStyles.adaptiveFontSize(
                      context,
                      isTablet ? 10 : 8,
                    ),
                  )
                : AppStyles.font14RegularGreyColor(context),
          ),
        ],
      ),
    );
  }
}
