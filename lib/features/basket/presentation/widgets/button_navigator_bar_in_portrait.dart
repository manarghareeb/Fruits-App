import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_state.dart';
import 'package:fruits_app/features/basket/presentation/widgets/dotted_divider.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/order_details.dart';
import 'package:go_router/go_router.dart';

class ButtonNavigatorBarInPortrait extends StatelessWidget {
  const ButtonNavigatorBarInPortrait({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoaded &&
              !AppResponsive.isLandscape(context)) {
            final List<Map<String, String>> priceDetails = [
              {
                'title': 'Subtotal',
                'value': '${state.totalPrice.toStringAsFixed(2)} KD',
              },
              {'title': 'Shipping Charges', 'value': '1.50 KD'},
              {
                'title': 'Bag Total',
                'value':
                    '${(state.totalPrice + 1.5).toStringAsFixed(2)} KD',
              },
            ];
            return Padding(
              padding: EdgeInsets.only(
                left: 20.w,
                right: 20.w,
                bottom: 30.h,
                top: 16.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const DottedDivider(),
                  SizedBox(height: 20.h),
                  OrderDetails(orderDetails: priceDetails),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${state.products.length} items in cart',
                              style: AppStyles.font16RegularDarkGreyColor(
                                context,
                              ),
                            ),
                            Text(
                              '${(state.totalPrice + 1.5).toStringAsFixed(2)} KD',
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
                          onPressed: () => GoRouter.of(
                            context,
                          ).push(AppRoute.checkoutScreen),
                          textStyle: AppStyles.font16RegularDarkGreyColor(
                            context,
                          ).copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      );
  }
}