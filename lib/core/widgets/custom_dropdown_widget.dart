import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class CustomDropdownWidget extends StatelessWidget {
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdownWidget({
    super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down, size: 20.sp),
          style: isLandscape ? AppStyles.font14RegularBlackColor.copyWith(
            fontSize: 10.sp
          ) : AppStyles.font14RegularBlackColor,
          dropdownColor: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          onChanged: onChanged,
          items: items.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
      ),
    );
  }
}
