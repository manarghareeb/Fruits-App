import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';
import 'package:fruits_app/features/home/presentation/views/product_details_screen.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_card_item.dart';
import 'package:fruits_app/features/home/presentation/widgets/seller_card_item.dart';
import 'package:fruits_app/features/vendors/domain/entities/vendor_entity/vendor_entity.dart';
import 'package:fruits_app/features/vendors/presentation/vendor_products_cubit/vendor_products_cubit.dart';
import 'package:fruits_app/features/vendors/presentation/vendor_products_cubit/vendor_products_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SellerDetailsScreen extends StatelessWidget {
  const SellerDetailsScreen({super.key, required this.vendor});
  final VendorEntity vendor;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: vendor.nameEn,
        isLeading: true,
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.search,
              color: Colors.black,
              size: isLandscape ? 15.sp : 20.sp,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SellerCardItem(
                imagePath: AppImages.companyLogo,
                name: vendor.nameEn,
                deliveryInfo: 'Delivery : 40 to 60 Min',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Products',
                    style: AppStyles.font18BoldBlackColor(context),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.filter_list, size: 20.sp),
                  ),
                ],
              ),
              BlocBuilder<VendorProductsCubit, VendorProductsState>(
                builder: (context, state) {
                  if (state is VendorProductsLoading) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5, // عدد العناصر الوهمية
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Skeletonizer(
                            enabled: true,
                            child: ProductCardItem(
                              productEntity: ProductEntity(
                                id: 0,
                                nameEn: 'Loading',
                                name: 'Loading',
                                price: 0.0,
                                discount: 0.0,
                                image: '',
                                quantity: 0,
                                unit: '',
                                unitEn: '',
                                details: '',
                                detailsEn: '',
                                vendorId: 0,
                                categoryId: 0,
                                nameCategory: '',
                                nameCategoryEn: '',
                                isFavorite: 0,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is VendorProductsSuccess) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.vendorProducts.length,
                      itemBuilder: (context, index) {
                        final product = state.vendorProducts[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    productEntity: product,
                                  ),
                                ),
                              );
                            },
                            child: ProductCardItem(productEntity: product),
                          ),
                        );
                      },
                    );
                  } else if (state is VendorProductsError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
