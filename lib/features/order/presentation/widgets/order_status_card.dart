import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';

class OrderStatusCard extends StatelessWidget {
  final String orderId;
  final String price;
  final String date;
  final String itemCount;
  final String status;

  const OrderStatusCard({
    super.key,
    required this.orderId,
    required this.price,
    required this.date,
    required this.itemCount,
    required this.status,
  });

  Color getStatusColor() {
    switch (status) {
      case 'Delivering':
        return const Color(0xFFFEC500);
      case 'Finished':
        return AppColors.greenColor;
      case 'Canceled':
        return AppColors.redColor;
      case 'Working':
        return const Color(0xFF264493);
      case 'New':
        return const Color(0xFF28B0E8);
      default:
        return const Color(0xFFCD28E8);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color mainColor = getStatusColor();

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: mainColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              status == 'Completed'
                  ? Icons.check_circle_outline
                  : Icons.local_shipping_outlined,
              color: mainColor,
              size: 28.sp,
            ),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#$orderId - $price KD",
                  style: AppStyles.font18BoldBlackColor,
                ),
                SizedBox(height: 4.h),
                Text(
                  "$date  •  $itemCount items",
                  style: AppStyles.font16RegularDarkGreyColor,
                ),
                SizedBox(height: 4.h),
                RichText(
                  text: TextSpan(
                    text: "Status : ",
                    style: AppStyles.font16RegularDarkGreyColor,
                    children: [
                      TextSpan(
                        text: status,
                        style: AppStyles.font16RegularDarkGreyColor.copyWith(
                          color: mainColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 65.w,
            height: 65.h,
            decoration: BoxDecoration(
              color: mainColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: mainColor.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(Icons.chevron_right, color: Colors.white, size: 24.sp),
          ),
        ],
      ),
    );
  }
}
