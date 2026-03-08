import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/features/home/presentation/widgets/price_after_and_before_discount.dart';

class ProductHeaderSection extends StatelessWidget {
  const ProductHeaderSection({super.key, required this.productName, required this.categoryName, required this.priceAfterDiscount, required this.priceBeforeDiscount});
  final String productName;
  final String categoryName;
  final String priceAfterDiscount;
  final String priceBeforeDiscount;

  @override
  Widget build(BuildContext context) {
    final isLandspace = AppResponsive.isLandscape(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryName,
              style: AppStyles.font16BoldPrimaryColor(
                context,
              ).copyWith(fontSize: isLandspace ? 10.sp : 16.sp),
            ),
            Text(
              productName,
              style: AppStyles.font24RegularBlackColor(
                context,
              ).copyWith(fontSize: isLandspace ? 14.sp : 24.sp),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price', style: AppStyles.font14RegularDarkGreyColor(context)),
            PriceAfterAndBeforeDiscount(
              details: true,
              priceAfterDiscount: priceAfterDiscount,
              priceBeforeDiscount: priceBeforeDiscount,
            ),
          ],
        ),
      ],
    );
  }
}
