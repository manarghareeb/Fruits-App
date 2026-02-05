import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/features/basket/presentation/widgets/dotted_divider.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/build_step.dart';

class StepIndicatorWidget extends StatelessWidget {
  final int currentStep;
  final List<String> steps;

  const StepIndicatorWidget({
    super.key,
    required this.currentStep,
    this.steps = const ['Delivery Time', 'Delivery Address', 'Payment'],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: List.generate(steps.length * 2 - 1, (index) {
            final isCircle = index.isEven;
            final stepIndex = index ~/ 2;

            if (isCircle) {
              return BuildStep(
                stepIndex: stepIndex,
                title: steps[stepIndex],
                currentStep: currentStep,
              );
            } else {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.h, left: 4.w, right: 4.w),
                  child: DottedDivider(
                    color: currentStep > stepIndex
                        ? AppColors.primaryColor
                        : Colors.grey.shade400,
                    dashWidth: 4,
                    dashSpace: 2,
                  ),
                ),
              );
            }
          }),
        ),
      ],
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/features/basket/presentation/widgets/dotted_divider.dart';

class StepIndicatorWidget extends StatelessWidget {
  final int currentStep;
  const StepIndicatorWidget({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    final steps = ['Delivery Time', 'Delivery Address', 'Payment'];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(steps.length * 2 - 1, (index) {
            final bool isCircle = index.isEven;
            final int stepIndex = index ~/ 2;

            if (isCircle) {
              final bool isActive = currentStep == stepIndex;
              final bool isCompleted = currentStep > stepIndex;

              return Container(
                width: 26.w,
                height: 26.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: (isActive || isCompleted)
                        ? AppColors.primaryColor
                        : Colors.grey.shade400,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (isActive || isCompleted)
                          ? AppColors.primaryColor
                          : Colors.grey.shade400,
                    ),
                  ),
                ),
              );
            } else {
              final bool isPassed = currentStep > (index ~/ 2);
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: DottedDivider(
                    color: isPassed
                        ? AppColors.primaryColor
                        : Colors.grey.shade400,
                    dashWidth: 4,
                    dashSpace: 3,
                  ),
                ),
              );
            }
          }),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(steps.length, (index) {
            final bool isActive = currentStep == index;
            return Expanded(
              child: Center(
                child: Text(
                  steps[index],
                  style: AppStyles.font14RegularGreyColor.copyWith(
                    color: isActive
                        ? AppColors.primaryColor
                        : Colors.grey.shade500,
                    fontWeight:
                        isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
*/
