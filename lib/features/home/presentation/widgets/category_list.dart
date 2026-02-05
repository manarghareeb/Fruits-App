import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/widgets/custom_image_card.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.categoryImages,
  });

  final List<String> categoryImages;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: categoryImages
            .map(
              (path) => Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.w,
                  vertical: 8.h,
                ),
                child: CustomImageCard(imagePath: path),
              ),
            )
            .toList(),
      ),
    );
  }
}
