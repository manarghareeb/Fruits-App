import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class CustomImageCard extends StatelessWidget {
  final String imagePath;
  final double? radius;
  final bool isCircle;

  const CustomImageCard({
    super.key,
    required this.imagePath,
    this.radius,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    final isTablet = AppResponsive.isTablet(context);
    return Container(
      width: isLandscape ? isTablet ? 40.w : 35.w : 80.w,
      height: isLandscape ? isTablet ? 40.w : 35.w : 80.h,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : BorderRadius.circular(radius ?? 25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      child: Image.asset(imagePath, fit: BoxFit.fill),
    );
    /*Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle ? null : BorderRadius.circular(radius ?? 25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 60.r,
        child: Image.asset(imagePath, fit: BoxFit.fill),
      ),
    );*/
  }
}
