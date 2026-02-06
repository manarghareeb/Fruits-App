import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';

class SelectedCheckedRow extends StatelessWidget {
  const SelectedCheckedRow({
    super.key,
    required this.title,
    this.isSelected = false,
    this.child,
    this.iconWidget,
    this.showIcon = false,
    this.isAddress = false,
    this.onTap,
  });

  final String title;
  final bool isSelected;
  final Widget? child;
  final Widget? iconWidget;
  final bool showIcon;
  final bool isAddress;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.25),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (iconWidget != null) ...[
                      iconWidget!,
                      SizedBox(width: 5.w),
                    ] else if (showIcon) ...[
                      Icon(FontAwesomeIcons.locationDot, size: 20.sp,),
                      SizedBox(width: 5.w),
                    ],
                    Text(title, style: AppStyles.font16BoldBlackColor),
                  ],
                ),
                if (!isAddress)
                  Container(
                    width: 25.w,
                    height: 25.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      shape: BoxShape.circle,
                      color: isSelected
                          ? AppColors.primaryColor
                          : Colors.transparent,
                    ),
                    child: isSelected
                        ? Icon(Icons.check, color: Colors.white, size: 15.sp)
                        : null,
                  ),
                if (isAddress)
                  GestureDetector(onTap: onTap, child: Icon(Icons.add, size: 20.sp,)),
              ],
            ),
            if (child != null) ...[SizedBox(height: 10.h), child!],
          ],
        ),
      ),
    );
  }
}
