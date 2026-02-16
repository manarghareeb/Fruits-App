import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/basket/presentation/widgets/basket_landscape_layout.dart';
import 'package:fruits_app/features/basket/presentation/widgets/basket_portrait_layout.dart';
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
      body: isLandscape
          ? BasketLandscapeLayout(orderDetails: price)
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 15.w),
              child: BasketPortraitLayout(price: price),
            ),
      bottomNavigationBar: isLandscape
          ? null
          : Padding(
              padding: EdgeInsets.only(
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
                          style: AppStyles.font16RegularDarkGreyColor(context),
                        ),
                        Text(
                          '37.50 KD',
                          style: AppStyles.font16RegularDarkGreyColor(
                            context,
                          ).copyWith(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: CustomButtonWidget(
                      title: 'Proceed To Checkout',
                      onPressed: () =>
                          GoRouter.of(context).push(AppRoute.checkoutScreen),
                      textStyle: AppStyles.font16RegularDarkGreyColor(
                        context,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
