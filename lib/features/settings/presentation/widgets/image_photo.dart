import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/theme/colors.dart';

class ImagePhoto extends StatelessWidget {
  const ImagePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.lightBlackColor),
      ),
      child: Icon(
        FontAwesomeIcons.user,
        color: AppColors.lightBlackColor,
        size: 40.sp,
      ),
    );
  }
}
