import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_selection_row.dart';
import 'package:go_router/go_router.dart';

class CustomSelectionDialog extends StatefulWidget {
  final String initialValue;
  final List<Map<String, String?>> options;
  final Function(String) onApply;
  final Widget? headerWidget;

  const CustomSelectionDialog({
    super.key,
    required this.initialValue,
    required this.options,
    required this.onApply,
    this.headerWidget,
  });

  @override
  State<CustomSelectionDialog> createState() => _CustomSelectionDialogState();
}

class _CustomSelectionDialogState extends State<CustomSelectionDialog> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.r)),
      contentPadding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.headerWidget != null) widget.headerWidget!,
          ...widget.options.map(
            (option) => CustomSelectionRow(
              title: option['title']!,
              value: option['value']!,
              iconPath: option['icon'],
              showIcon: option['icon'] != null,
              isSelected: selectedValue == option['value'],
              onTap: () => setState(() => selectedValue = option['value']!),
            ),
          ),
          SizedBox(height: 32.h),
          CustomButtonWidget(
            height: isLandscape ? 30.sp : 40.sp,
            title: 'Apply',
            onPressed: () {
              widget.onApply(selectedValue);
              context.pop();
            },
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Close', style: isLandscape ? AppStyles.font16RegularDarkGreyColor.copyWith(
              fontSize: 12.sp
            ) : AppStyles.font16RegularDarkGreyColor),
          ),
        ],
      ),
    );
  }
}
