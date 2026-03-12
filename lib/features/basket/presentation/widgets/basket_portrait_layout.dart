import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_card_item.dart';

class BasketPortraitLayout extends StatelessWidget {
  const BasketPortraitLayout({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: products.length,
          separatorBuilder: (context, index) => SizedBox(height: 7.h),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //GoRouter.of(context).push(AppRoute.productDetailsScreen);
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ProductCardItem(
                  productEntity: products[index],
                  isCart: true,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
