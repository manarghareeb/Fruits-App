import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

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
    final isTablet = AppResponsive.isTablet(context);
    final isLandscape = AppResponsive.isLandscape(context);

    return Container(
      padding: isLandscape ? EdgeInsets.symmetric(
        horizontal: 2.w, vertical: 12.h
      ) : EdgeInsets.all(12.w),
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
            width: isTablet ? 40.w : 60.w,
            height: isTablet ? 40.w : 60.h,
            decoration: BoxDecoration(
              color: mainColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              status == 'Completed'
                  ? Icons.check_circle_outline
                  : Icons.local_shipping_outlined,
              color: mainColor,
              size: isLandscape ? 20.sp : 28.sp,
            ),
          ),
          SizedBox(width: isLandscape ? 2.w : 15.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#$orderId - $price KD",
                  style: AppStyles.font18BoldBlackColor(context).copyWith(
                    fontSize: isLandscape ? 10.sp : 18.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  "$date  •  $itemCount items",
                  style: AppStyles.font16RegularDarkGreyColor(context).copyWith(
                    fontSize: isLandscape ? 8.sp : 16.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                RichText(
                  text: TextSpan(
                    text: "Status : ",
                    style: AppStyles.font16RegularDarkGreyColor(context).copyWith(
                    fontSize: isLandscape ? 8.sp : 16.sp,
                  ),
                    children: [
                      TextSpan(
                        text: status,
                        style: AppStyles.font16RegularDarkGreyColor(context)
                            .copyWith(
                              fontSize: isLandscape ? 8.sp : 16.sp,
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
            width: isLandscape ? (isTablet ? 30.w : 50.w) : (isTablet ? 30.w : 65.w),
            height: isTablet ? 30.w : 65.h,
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
            child: Icon(
              Icons.chevron_right, 
              color: Colors.white, size: isLandscape ? 20.sp : 24.sp
            ),
          ),
        ],
      ),
    );
  }
}
