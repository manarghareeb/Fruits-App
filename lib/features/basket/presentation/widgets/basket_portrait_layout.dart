import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/features/basket/presentation/widgets/dotted_divider.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/order_details.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_card_item.dart';
import 'package:go_router/go_router.dart';

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
                  price: 'KD14.00',
                  productName: 'Product Name',
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
