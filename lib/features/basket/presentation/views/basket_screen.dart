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

/*class BasketScreen extends StatelessWidget {
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
          child: isLandscape ? BasketLandscapeLayout(orderDetails: price) : BasketPortraitLayout(price: price),
        ),
      ),
      bottomNavigationBar: isLandscape
          ? SizedBox.shrink()
          : Padding(
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
                      title: 'Procced To Checkout',
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

class BasketPortraitLayout extends StatelessWidget {
  const BasketPortraitLayout({
    super.key,
    required this.price,
  });

  final List<Map<String, String>> price;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

/*class BasketLandscapeLayout extends StatelessWidget {
  const BasketLandscapeLayout({super.key, required this.orderDetails});
  final List<Map<String, String>> orderDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4.h,
                ),
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
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  OrderDetails(orderDetails: orderDetails),
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
                  CustomButtonWidget(
                    title: 'Procced To Checkout',
                    onPressed: () =>
                        GoRouter.of(context).push(AppRoute.checkoutScreen),
                    textStyle: AppStyles.font16RegularDarkGreyColor(
                      context,
                    ).copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}*/

class BasketLandscapeLayout extends StatelessWidget {
  const BasketLandscapeLayout({super.key, required this.orderDetails});
  final List<Map<String, String>> orderDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left: scrollable product grid
        Expanded(
          flex: 2,
          child: GridView.builder(
            padding: EdgeInsets.all(12.w),
            itemCount: 5, // number of products
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 8.w,
              childAspectRatio: 2.5, // width / height ratio
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRoute.productDetailsScreen);
                },
                child: const ProductCardItem(
                  imagePath: AppImages.fruitsImage,
                  isCart: true,
                ),
              );
            },
          ),
        ),

        // Right: fixed order summary
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
                  '4 items in cart',
                  style: AppStyles.font16RegularDarkGreyColor(context),
                ),
                Text(
                  '37.50 KD',
                  style: AppStyles.font16RegularDarkGreyColor(context)
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const Spacer(), // pushes button to bottom
                CustomButtonWidget(
                  title: 'Proceed To Checkout',
                  onPressed: () =>
                      GoRouter.of(context).push(AppRoute.checkoutScreen),
                  textStyle: AppStyles.font16RegularDarkGreyColor(context)
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
*/

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

class BasketLandscapeLayout extends StatelessWidget {
  const BasketLandscapeLayout({super.key, required this.orderDetails});
  final List<Map<String, String>> orderDetails;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            itemCount: 5,
            separatorBuilder: (context, index) => SizedBox(height: 7.h),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>
                    GoRouter.of(context).push(AppRoute.productDetailsScreen),
                child: const ProductCardItem(
                  imagePath: AppImages.fruitsImage,
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
                  '4 items in cart',
                  style: AppStyles.font16RegularDarkGreyColor(
                    context,
                  ).copyWith(fontSize: isLandscape ? 10.sp : 16.sp),
                ),
                Text(
                  '37.50 KD',
                  style: AppStyles.font16RegularDarkGreyColor(
                    context,
                  ).copyWith(fontWeight: FontWeight.w500, 
                  fontSize: isLandscape ? 10.sp : 16.sp),
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

class BasketPortraitLayout extends StatelessWidget {
  const BasketPortraitLayout({super.key, required this.price});

  final List<Map<String, String>> price;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
