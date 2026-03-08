import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_image_card.dart';
import 'package:fruits_app/features/categories/domain/entities/category_entity.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.categories, this.onCategoryTap});

  final List<CategoryEntity> categories;
  final Function(CategoryEntity)? onCategoryTap;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    final isTablet = AppResponsive.isTablet(context);
    final isWidth = isLandscape
        ? isTablet
              ? 70.w
              : 70.w
        : 80.w;
    final isHeight = isLandscape
        ? isTablet
              ? 70.w
              : 70.w
        : 80.h;

    if (categories.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Center(
          child: Text(
            'There are no category now',
            style: AppStyles.font14RegularBlackColor(context),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: categories.map((category) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: GestureDetector(
              onTap: () => onCategoryTap?.call(category),
              child: Column(
                children: [
                  CustomImageCard(
                    imagePath: AppImages.coffee,
                    width: isWidth,
                    height: isHeight,
                  ),
                  SizedBox(height: 7.h),
                  Text(
                    category.nameEn,
                    textAlign: TextAlign.center,
                    style: AppStyles.font14RegularBlackColor(context),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
