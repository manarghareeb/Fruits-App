import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/order_details.dart';
import 'package:fruits_app/features/home/presentation/views/product_details_screen.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_card_item.dart';
import 'package:go_router/go_router.dart';

class BasketLandscapeLayout extends StatelessWidget {
  const BasketLandscapeLayout({
    super.key,
    required this.orderDetails,
    required this.products,
    required this.countItem,
    required this.priceCart,
  });
  final List<Map<String, String>> orderDetails;
  final List<ProductEntity> products;
  final int countItem;
  final String priceCart;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            itemCount: products.length,
            separatorBuilder: (context, index) => SizedBox(height: 7.h),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        productEntity: products[index],
                      ),
                    ),
                  );
                },
                child: ProductCardItem(
                  productEntity: products[index],
                  isCart: true,
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OrderDetails(orderDetails: orderDetails),
                SizedBox(height: 16.h),
                Text(
                  '$countItem items in cart',
                  style: AppStyles.font16RegularDarkGreyColor(
                    context,
                  ).copyWith(fontSize: isLandscape ? 10.sp : 16.sp),
                ),
                Text(
                  '$priceCart KD',
                  style: AppStyles.font16RegularDarkGreyColor(context).copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: isLandscape ? 10.sp : 16.sp,
                  ),
                ),
                const Spacer(),
                CustomButtonWidget(
                  width: isLandscape ? 70.w : 270.w,
                  height: isLandscape ? 25.w : 270.w,
                  title: 'Proceed To Checkout',
                  onPressed: () =>
                      GoRouter.of(context).push(AppRoute.checkoutScreen),
                  textStyle: AppStyles.font16RegularDarkGreyColor(context)
                      .copyWith(
                        color: Colors.white,
                        fontSize: isLandscape ? 8.sp : 16.sp,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
