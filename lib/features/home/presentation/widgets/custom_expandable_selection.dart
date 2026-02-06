import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_selection_row.dart';

class CustomExpandableSelection extends StatefulWidget {
  const CustomExpandableSelection({
    super.key,
    required this.title,
    required this.list,
    required this.selectedItem,
    required this.onSelect,
  });

  final String title;
  final List<String> list;
  final String? selectedItem;
  final ValueChanged<String> onSelect;

  @override
  State<CustomExpandableSelection> createState() =>
      _CustomExpandableSelectionState();
}

class _CustomExpandableSelectionState extends State<CustomExpandableSelection> {
  bool isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isDropdownOpen = !isDropdownOpen;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title, style: AppStyles.font18BoldBlackColor),
              Icon(
                isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: AppColors.primaryColor,
                size: 25.sp,
              ),
            ],
          ),
        ),
        Divider(color: AppColors.greyColor),
        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Column(
            children: widget.list.map((item) {
              return CustomSelectionRow(
                title: item,
                value: item,
                isSelected: widget.selectedItem == item,
                onTap: () {
                  widget.onSelect(item);
                },
              );
            }).toList(),
          ),
          crossFadeState: isDropdownOpen
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 200),
        ),
      ],
    );
  }
}
