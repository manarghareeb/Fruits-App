import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';

class BuildStep extends StatelessWidget {
  const BuildStep({
    super.key,
    required this.stepIndex,
    required this.title,
    required this.currentStep,
  });
  final int stepIndex;
  final String title;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    bool isCompleted = currentStep > stepIndex;
    bool isActive = currentStep == stepIndex;

    return Column(
      children: [
        Container(
          width: 24.w,
          height: 24.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: (isActive || isCompleted)
                  ? AppColors.primaryColor
                  : Colors.grey.shade400,
              width: 2,
            ),
            color: isCompleted ? AppColors.primaryColor : Colors.white,
          ),
          child: Center(
            child: isCompleted
                ? Icon(Icons.check, size: 14.sp, color: Colors.white)
                : Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive
                          ? AppColors.primaryColor
                          : Colors.transparent,
                    ),
                  ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: (isActive || isCompleted)
              ? AppStyles.font14RegularGreyColor.copyWith(
                  color: AppColors.primaryColor,
                )
              : AppStyles.font14RegularGreyColor,
        ),
      ],
    );
  }
}