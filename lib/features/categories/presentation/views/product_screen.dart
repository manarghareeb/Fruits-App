import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/di/service_locator.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/categories/domain/entities/sub_category_entity.dart';
import 'package:fruits_app/features/favorite/presentation/cubit/add_or_remove_favorite_cubit/add_or_remove_favorite_cubit.dart';
import 'package:fruits_app/features/home/presentation/views/product_details_screen.dart';

class ProductsScreen extends StatelessWidget {
  final SubCategoryEntity subCategory;
  const ProductsScreen({super.key, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: subCategory.nameEn),
      body: subCategory.products.isEmpty
          ? const Center(child: Text('Sorry, there are no products now'))
          : GridView.builder(
              padding: EdgeInsets.all(16.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.7,
              ),
              itemCount: subCategory.products.length,
              itemBuilder: (context, index) {
                final product = subCategory.products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BlocProvider(
                          create: (context) => sl<AddOrRemoveFavoriteCubit>(),
                          child: ProductDetailsScreen(productEntity: product),
                        ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Expanded(child: Image.network(product.image, fit: BoxFit.cover)),
                        Expanded(child: Image.asset(AppImages.fruitsImage)),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.nameEn,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
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
