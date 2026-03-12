import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class CountContainer extends StatelessWidget {
  const CountContainer({
    super.key, 
    this.padding, 
    required this.quantity, 
    required this.onIncrement, 
    required this.onDecrement
  });
  final EdgeInsetsGeometry? padding;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Container(
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal: isLandscape ? 8.w : 17.5.w,
            vertical: isLandscape ? 2.h : 4.h,
          ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 4,
            color: Colors.black.withOpacity(0.25),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(6.r),
            onTap: onDecrement,
            child: SizedBox(
              width: isLandscape ? 20.sp : 24.w,
              height: isLandscape ? 20.sp : 24.w,
              child: Icon(Icons.remove, size: isLandscape ? 12.sp : 18.sp),
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            quantity.toString(),
            textAlign: TextAlign.center,
            style: AppStyles.font16RegularDarkGreyColor(
              context,
            ).copyWith(fontSize: isLandscape ? 10.sp : 16.sp),
          ),
          SizedBox(width: 8.w),
          InkWell(
            borderRadius: BorderRadius.circular(6.r),
            onTap: onIncrement,
            child: SizedBox(
              width: isLandscape ? 20.sp : 24.w,
              height: isLandscape ? 20.sp : 24.w,
              child: Icon(Icons.add, size: isLandscape ? 12.sp : 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
