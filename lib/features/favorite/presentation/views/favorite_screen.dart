import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_card_item.dart';
import 'package:go_router/go_router.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Favorite'),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 15.w),
        child: ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
          itemCount: 3,
          separatorBuilder: (context, index) => SizedBox(height: 7.h),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                GoRouter.of(context).push(AppRoute.productDetailsScreen);
              },
              child: const ProductCardItem(
                imagePath: AppImages.fruitsImage,
                isCart: true,
                isFavorite: true,
              ),
            );
          },
        ),
      ),
    );
  }
}
