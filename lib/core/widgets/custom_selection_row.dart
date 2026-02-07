import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class CustomSelectionRow extends StatelessWidget {
  const CustomSelectionRow({
    super.key,
    required this.title,
    required this.value,
    this.iconPath,
    required this.isSelected,
    required this.onTap,
    this.showIcon = true,
  });

  final String title;
  final String value;
  final String? iconPath;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            Container(
              width: isLandscape ? 18.w : 24.w,
              height: isLandscape ? 18.w : 24.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primaryColor
                      : Colors.grey.shade400,
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 16.sp,
                      color: AppColors.primaryColor,
                    )
                  : null,
            ),
            SizedBox(width: 12.w),
            if (showIcon && iconPath != null) ...[
              SizedBox(width: 12.w),
              SvgPicture.asset(
                iconPath!,
                width: isLandscape ? 12.sp : 28.w,
                height: isLandscape ? 12.sp : 20.h,
                fit: BoxFit.cover,
              ),
            ],
            SizedBox(width: 12.w),
            Text(title, style: isLandscape ? AppStyles.font16RegularDarkGreyColor.copyWith(
              fontSize: 12.sp
            ) : AppStyles.font16RegularDarkGreyColor),
          ],
        ),
      ),
    );
  }
}
