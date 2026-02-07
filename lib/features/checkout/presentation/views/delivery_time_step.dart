import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/selected_checked_row.dart';

class DeliveryTimeStep extends StatefulWidget {
  const DeliveryTimeStep({super.key});

  @override
  State<DeliveryTimeStep> createState() => _DeliveryTimeStepState();
}

class _DeliveryTimeStepState extends State<DeliveryTimeStep> {
  bool isNowSelected = true;
  DateTime selectedDate = DateTime.now();

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primaryColor,
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryColor,
            ),
          ),
        ),
        child: child!,
      ),
    );

    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectedCheckedRow(
          title: 'Now',
          isSelected: isNowSelected,
          onTap: () => setState(() => isNowSelected = true),
        ),
        SizedBox(height: 23.h),
        SelectedCheckedRow(
          title: 'Select Delivery Time',
          isSelected: !isNowSelected,
          onTap: () => setState(() => isNowSelected = false),
          child: !isNowSelected
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Date',
                      style: AppStyles.font14RegularGreyColor(context),
                    ),
                    SizedBox(height: 8.h),
                    GestureDetector(
                      onTap: pickDate,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${selectedDate.day.toString().padLeft(2, '0')} - ${selectedDate.month.toString().padLeft(2, '0')} - ${selectedDate.year}',
                            style: AppStyles.font16BoldPrimaryColor(context),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: isLandscape ? 15.sp : 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : null,
        ),
      ],
    );
  }
}
