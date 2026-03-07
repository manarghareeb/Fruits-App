import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';

class SettingsListView extends StatelessWidget {
  const SettingsListView({
    super.key,
    required this.list,
    required this.isTablet,
    required this.isLandscape,
  });

  final List<Map<String, dynamic>> list;
  final bool isTablet;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return ListTile(
          onTap: item['onTap'],
          leading: Icon(
            item['icon'],
            color: AppColors.primaryColor,
            size: isTablet ? 10.sp : 15.sp,
          ),
          title: Text(
            item['title'],
            style: AppStyles.font14RegularBlackColor(context),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: isLandscape ? 10.sp : 15.sp,
            color: AppColors.greyColor,
          ),
        );
      },
    );
  }
}
