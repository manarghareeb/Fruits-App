import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.backgroundColor,
    this.bordercolor,
    this.textColor,
    this.icon,
    this.svgPath,
    this.textStyle,
    this.height
  });

  final String title;
  final VoidCallback onPressed;
  final double? width;
  final Color? backgroundColor;
  final Color? bordercolor;
  final Color? textColor;
  final IconData? icon;
  final String? svgPath;
  final TextStyle? textStyle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final isTablet = AppResponsive.isTablet(context);
    final isLandscape = AppResponsive.isLandscape(context);
    final buttonWidth = width ?? 
    (isTablet
        ? 0.5.sw
        : isLandscape
            ? 0.4.sw
            : 0.7.sw);
    final buttonHeight = height ??
    (isTablet
        ? 55.h
        : isLandscape
            ? 40.h
            : 45.h);
    
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryColor,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: bordercolor ?? AppColors.primaryColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      width: buttonWidth,
      height: buttonHeight,
      child: TextButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgPath != null)
              SvgPicture.asset(svgPath!, width: 25.w, height: 25.h)
            else if (icon != null)
              Icon(icon, color: textColor ?? Colors.white, size: 20.sp),
            SizedBox(width: (icon != null || svgPath != null) ? 10 : 0),
            Text(
              title,
              style: isLandscape ?
                  textStyle ??
                  AppStyles.font18BoldWhiteColor.copyWith(
                    color: textColor ?? Colors.white,
                  ) :textStyle ?? AppStyles.font14RegularBlackColor.copyWith(
                    color: Colors.white
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
