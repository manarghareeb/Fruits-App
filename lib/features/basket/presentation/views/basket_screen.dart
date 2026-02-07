import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/basket/presentation/widgets/dotted_divider.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/order_details.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_card_item.dart';
import 'package:go_router/go_router.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    final List<Map<String, String>> price = [
      {'title': 'Subtotal', 'value': '36.00 KD'},
      {'title': 'Shipping Charges', 'value': '1.50 KD'},
      {'title': 'Bag Total', 'value': '37.50 KD'},
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Basket'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                separatorBuilder: (context, index) => SizedBox(height: 7.h),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoute.productDetailsScreen);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: const ProductCardItem(
                        imagePath: AppImages.fruitsImage,
                        isCart: true,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              const DottedDivider(),
              SizedBox(height: 20.h),
              OrderDetails(orderDetails: price),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.only(
          left: 20.w,
          right: 20.w,
          bottom: 30.h,
          top: 16.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '4 items in cart',
                    style: isLandscape ? AppStyles.font16RegularDarkGreyColor.copyWith(
                      fontSize: 12.sp
                    ) : AppStyles.font16RegularDarkGreyColor,
                  ),
                  Text(
                    '37.50 KD',
                    style: isLandscape ? AppStyles.font16RegularDarkGreyColor.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 12.sp
                    ) : AppStyles.font16RegularDarkGreyColor.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomButtonWidget(
                title: 'Procced To Checkout',
                onPressed: () => GoRouter.of(context).push(AppRoute.checkoutScreen),
                textStyle: isLandscape ? AppStyles.font16RegularDarkGreyColor.copyWith(
                  color: Colors.white, fontSize: 12.sp
                ) : AppStyles.font16RegularDarkGreyColor.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
