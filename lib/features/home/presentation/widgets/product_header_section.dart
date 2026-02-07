import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/features/home/presentation/widgets/price_after_and_before_discount.dart';

class ProductHeaderSection extends StatelessWidget {
  const ProductHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category Name',
              style: AppStyles.font24BoldPrimaryColor.copyWith(
                fontSize: isLandscape ? 12.sp : 16.sp,
              ),
            ),
            Text(
              'Product Name',
              style: isLandscape
                  ? AppStyles.font18RegularBlackColor
                  : AppStyles.font24RegularBlackColor,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Price',
              style: isLandscape
                  ? AppStyles.font14RegularDarkGreyColor.copyWith(
                      fontSize: 10.sp,
                    )
                  : AppStyles.font14RegularDarkGreyColor,
            ),
            const PriceAfterAndBeforeDiscount(
              details: true,
              priceAfterDiscount: 'KD12.00',
              priceBeforeDiscount: 'KD14.00',
            ),
          ],
        ),
      ],
    );
  }
}
