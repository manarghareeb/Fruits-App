import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/categories/domain/entities/category_entity.dart';
import 'package:fruits_app/features/categories/presentation/views/product_screen.dart';

class SubCategoryScreen extends StatelessWidget {
  final CategoryEntity category;
  const SubCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: category.nameEn),
      body: category.subCategories.isEmpty
          ? const Center(child: Text('There are no sub category now'))
          : GridView.builder(
              padding: EdgeInsets.all(16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
              ),
              itemCount: category.subCategories.length,
              itemBuilder: (context, index) {
                final sub = category.subCategories[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsScreen(subCategory: sub),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        //Expanded(child: Image.network(sub.image)),
                        Expanded(child: Image.asset(AppImages.farm)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            sub.nameEn,
                            style: AppStyles.font14RegularBlackColor(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
