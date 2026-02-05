import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_dropdown_widget.dart';
import 'package:fruits_app/core/widgets/custom_selector_dialog.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String selectedArea = 'All Areas';

  final List<String> areas = [
    'All Areas',
    'Cairo',
    'Alexandria',
    'Giza',
    'Mansoura',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomSelectionDialog(
      headerWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Filter by', style: AppStyles.font18BoldBlackColor),
            ],
          ),
          SizedBox(height: 22.h),
          Row(
            children: [
              Text('Delivered To', style: AppStyles.font14RegularGreyColor),
              SizedBox(width: 8.w),
              Icon(
                Icons.delivery_dining_outlined,
                color: AppColors.primaryColor,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomDropdownWidget(
            selectedValue: selectedArea,
            items: areas,
            onChanged: (value) {
              setState(() {
                selectedArea = value!;
              });
            },
          ),
          SizedBox(height: 20.h),
        ],
      ),
      initialValue: 'Offers',
      options: const [
        {'title': 'Offers', 'value': 'Offers'},
        {'title': 'Free Delivery', 'value': 'FreeDelivery'},
      ],
      onApply: (val) => print(val),
    );
  }
}
