import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_image_card.dart';
import 'package:fruits_app/features/basket/presentation/widgets/count_container.dart';
import 'package:fruits_app/features/home/presentation/widgets/price_after_and_before_discount.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    required this.imagePath,
    this.isCart = false,
    this.isFavorite = false,
  });

  final String imagePath;
  final bool isCart;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 5.h,
                      ),
                      child: CustomImageCard(
                        imagePath: imagePath,
                        isCircle: true,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product name',
                            style: AppStyles.font16BoldBlackColor(context),
                          ),
                          SizedBox(height: 5.h),
                          const PriceAfterAndBeforeDiscount(
                            priceAfterDiscount: 'KD12.00',
                            priceBeforeDiscount: 'KD14.00',
                          ),
                          SizedBox(height: 9.h),
                          if (!isFavorite) ...[
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 3.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.lightRedColor,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Text(
                                'Up to 10% Off',
                                style: AppStyles.font12SemiBoldWhiteColor(
                                  context,
                                ),
                              ),
                            ),
                          ] else
                            Text(
                              'Store Name : Store 1',
                              style: AppStyles.font16RegularDarkGreyColor(
                                context,
                              ).copyWith(fontWeight: FontWeight.bold),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (isCart && !isFavorite)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.delete_forever,
                      color: AppColors.primaryColor,
                      size: isLandscape ? 20.sp : 28.sp,
                    ),
                    SizedBox(height: 25.h),
                    const CountContainer(),
                  ],
                )
              else if (!isCart)
                Container(
                  width: isLandscape ? 30.w : 55.w,
                  height: isLandscape ? 30.w : 50.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                    size: isLandscape ? 18.sp : 23.sp,
                  ),
                ),
            ],
          ),
        ),
        if (isCart && isFavorite)
          Positioned(
            top: 10.h,
            right: 10.w,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: isLandscape ? 20.w : 30.w,
                height: isLandscape ? 20.w : 30.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 4,
                      color: AppColors.blackColor.withOpacity(0.25),
                    ),
                  ],
                ),
                child: Icon(Icons.close, size: 20.sp),
              ),
            ),
          ),
      ],
    );
  }
}
