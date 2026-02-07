import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/features/home/presentation/widgets/price_after_and_before_discount.dart';

class ProductHeaderSection extends StatelessWidget {
  const ProductHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category Name',
              style: AppStyles.font16BoldPrimaryColor(context)
            ),
            Text(
              'Product Name',
              style: AppStyles.font24RegularBlackColor(context),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Price',
              style: AppStyles.font14RegularDarkGreyColor(context),
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
