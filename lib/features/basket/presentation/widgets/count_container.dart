import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class CountContainer extends StatefulWidget {
  const CountContainer({super.key, this.padding, this.onQuantityChanged});
  final EdgeInsetsGeometry? padding;
  final Function(int)? onQuantityChanged;

  @override
  State<CountContainer> createState() => _CountContainerState();
}

class _CountContainerState extends State<CountContainer> {
  int quantity = 1;

  void updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
    if (widget.onQuantityChanged != null) {
      widget.onQuantityChanged!(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Container(
      padding:
          widget.padding ??
          EdgeInsets.symmetric(horizontal: 17.5.w, vertical: 4.h),
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
            onTap: () {
              if (quantity > 1) updateQuantity(quantity - 1);
            },
            child: SizedBox(
              width: isLandscape ? 20.sp : 24.w,
              height: isLandscape ? 20.sp : 24.w,
              child: Icon(Icons.remove, size: isLandscape ? 12.sp : 18.sp),
            ),
          ),

          SizedBox(width: 8.w),

          SizedBox(
            width: 24.w,
            child: Text(
              quantity.toString(),
              textAlign: TextAlign.center,
              style: isLandscape ? AppStyles.font16RegularDarkGreyColor.copyWith(
                fontSize: 11.sp
              ) : AppStyles.font16RegularDarkGreyColor,
            ),
          ),

          SizedBox(width: 8.w),

          InkWell(
            borderRadius: BorderRadius.circular(6.r),
            onTap: () => updateQuantity(quantity + 1),
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
