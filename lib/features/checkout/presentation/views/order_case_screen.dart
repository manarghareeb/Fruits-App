import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:go_router/go_router.dart';

class OrderCaseScreen extends StatelessWidget {
  const OrderCaseScreen({super.key, this.isError = false});
  final bool isError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Checkout', isLeading: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 42.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (!isError) ...[
                Center(child: SvgPicture.asset(AppImages.success)),
                SizedBox(height: 55.h),
                Text(
                  'YOUR ORDER IS CONFIRMED!',
                  style: AppStyles.font24BoldPrimaryColor(context),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Your order code: #243188',
                  style: AppStyles.font18RegularDarkGreyColor(context),
                ),
                Text(
                  'Thank you for choosing our products!',
                  style: AppStyles.font18RegularDarkGreyColor(context),
                ),
                SizedBox(height: 32.h),
                CustomButtonWidget(
                  title: 'Continue Shopping',
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).pushReplacement(AppRoute.buttonNavigatorBar);
                  },
                ),
                SizedBox(height: 22.h),
                CustomButtonWidget(
                  title: 'Track Order',
                  textColor: AppColors.primaryColor,
                  backgroundColor: Colors.white,
                  bordercolor: AppColors.primaryColor,
                  onPressed: () {
                    GoRouter.of(context).push(AppRoute.orderTrackingScreen);
                  },
                ),
              ] else ...[
                Center(child: SvgPicture.asset(AppImages.error)),
                SizedBox(height: 46.h),
                Text(
                  'OPS',
                  style: AppStyles.font24BoldPrimaryColor(context).copyWith(
                    color: AppColors.redColor,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Error while confirming your payment/order',
                  textAlign: TextAlign.center,
                  style: AppStyles.font18RegularDarkGreyColor(context),
                ),
                SizedBox(height: 78.h),
                CustomButtonWidget(
                  title: 'Back',
                  backgroundColor: AppColors.redColor,
                  bordercolor: AppColors.redColor,
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).pushReplacement(AppRoute.buttonNavigatorBar);
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
