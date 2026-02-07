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
