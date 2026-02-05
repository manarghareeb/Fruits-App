import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/styles.dart';

class PriceAfterAndBeforeDiscount extends StatelessWidget {
  const PriceAfterAndBeforeDiscount({
    super.key,
    required this.priceAfterDiscount,
    required this.priceBeforeDiscount,
    this.details = false,
  });
  final String priceAfterDiscount;
  final String priceBeforeDiscount;
  final bool details;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$priceBeforeDiscount    ',
        style: details
            ? AppStyles.font18BoldBlackColor
            : AppStyles.font14RegularDarkGreyColor,
        children: [
          TextSpan(
            text: priceAfterDiscount,
            style: details
                ? AppStyles.font18RegularLightRedColorLineThrough
                : AppStyles.font14RegularGreyColorLineThrough,
          ),
        ],
      ),
    );
  }
}
