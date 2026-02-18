import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class CustomImageCard extends StatelessWidget {
  final String imagePath;
  final double? radius;
  final bool isCircle;
  final double? width;
  final double? height;

  const CustomImageCard({
    super.key,
    required this.imagePath,
    this.radius,
    this.isCircle = false, 
    this.width, 
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    final isTablet = AppResponsive.isTablet(context);
    final isWidth = isLandscape
        ? isTablet
              ? 40.w
              : 35.w
        : 80.w;
    final isHeight = isLandscape
        ? isTablet
              ? 40.w
              : 35.w
        : 80.h;

    return Container(
      width: width ?? isWidth,
      height: height ?? isHeight,
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
      padding: EdgeInsets.all(8.w),
      child: Image.asset(imagePath, fit: BoxFit.contain),
    );
  }
}
