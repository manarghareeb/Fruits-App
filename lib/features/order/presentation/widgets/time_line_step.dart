import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';

class TimelineStep extends StatelessWidget {
  const TimelineStep({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isCompleted,
    required this.isLast,
  });

  final String title;
  final String subtitle;
  final bool isCompleted;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 32.w,
              height: 32.h,
              decoration: BoxDecoration(
                color: isCompleted ? AppColors.greenColor : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.greenColor, width: 2),
              ),
              child: isCompleted
                  ? Icon(Icons.check, size: 14.sp, color: Colors.white)
                  : null,
            ),
            if (!isLast)
              Container(width: 2.w, height: 45.h, color: AppColors.greenColor),
          ],
        ),
        SizedBox(width: 15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppStyles.font18BoldBlackColor),
            Text(subtitle, style: AppStyles.font14RegularDarkGreyColor),
          ],
        ),
      ],
    );
  }
}
