import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_image_card.dart';

class SellerCardItem extends StatelessWidget {
  const SellerCardItem({
    super.key,
    required this.imagePath,
    required this.name,
    this.deliveryInfo,
    this.rating = "4.5",
    this.category = "Beverages",
    this.distance,
    this.isOpen = true,
  });

  final String imagePath;
  final String name;
  final String? deliveryInfo;
  final String rating;
  final String category;
  final String? distance;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 4,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          CustomImageCard(imagePath: imagePath, isCircle: true),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name, style: AppStyles.font18BoldBlackColor(context)),
                    SizedBox(width: 4.w),
                    if (distance != null)
                      Icon(
                        Icons.workspace_premium_outlined,
                        color: Colors.red[400],
                        size: 20.sp,
                      ),
                    const Spacer(),
                    if (distance != null)
                      Text(
                        rating,
                        style: AppStyles.font14RegularDarkGreyColor(context),
                      ),
                    if (distance == null)
                      Icon(
                        Icons.workspace_premium_outlined,
                        color: Colors.red[400],
                        size: 20.sp,
                      ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    if (distance != null)
                      Icon(
                        Icons.moped_outlined,
                        color: Colors.grey[400],
                        size: 18.sp,
                      ),
                    SizedBox(width: 6.w),
                    Text(
                      deliveryInfo ?? '',
                      style: AppStyles.font14RegularDarkGreyColor(context),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    CircleAvatar(
                      radius: isLandscape ? 5.r : 3.r,
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      isOpen ? "Open" : "Closed",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: isLandscape ? 9.sp : 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    CircleAvatar(
                      radius: isLandscape ? 5.r : 3.r,
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      distance != null ? category : rating,
                      style: TextStyle(
                        color: const Color(0xFF51949F),
                        fontSize: isLandscape ? 9.sp : 13.sp,
                      ),
                    ),
                    const Spacer(),
                    if (distance != null) ...[
                      Text(
                        distance!,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: isLandscape ? 8.sp : 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Icon(
                        Icons.location_on_outlined,
                        size: isLandscape ? 8.sp : 14.sp,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
