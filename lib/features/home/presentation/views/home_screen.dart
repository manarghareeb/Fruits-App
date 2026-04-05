import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/di/service_locator.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:fruits_app/features/categories/presentation/cubit/categories_state.dart';
import 'package:fruits_app/features/categories/presentation/views/sub_category_screen.dart';
import 'package:fruits_app/features/home/presentation/views/seller_details_screen.dart';
import 'package:fruits_app/features/home/presentation/widgets/banner_auto_scroll_section.dart';
import 'package:fruits_app/features/home/presentation/widgets/category_list.dart';
import 'package:fruits_app/features/home/presentation/widgets/filter_widget.dart';
import 'package:fruits_app/features/home/presentation/widgets/seller_card_item.dart';
import 'package:fruits_app/features/vendors/presentation/vendor_products_cubit/vendor_products_cubit.dart';
import 'package:fruits_app/features/vendors/presentation/vendors_cubit/vendor_cubit.dart';
import 'package:fruits_app/features/vendors/presentation/vendors_cubit/vendor_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    final isTablet = AppResponsive.isTablet(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              FontAwesomeIcons.search,
              color: Colors.black,
              size: isLandscape ? 15.sp : 20.sp,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              FontAwesomeIcons.sliders,
              color: Colors.black,
              size: isLandscape ? 15.sp : 20.sp,
            ),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => const FilterWidget(),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              BannerAutoScrollSection(height: isTablet ? 320 : 200),
              SizedBox(height: 16.h),
              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return Skeletonizer(
                      enabled: true,
                      child: CategoryList(categories: []),
                    );
                  } else if (state is CategoriesSuccess) {
                    return CategoryList(
                      categories: state.categories,
                      onCategoryTap: (category) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SubCategoryScreen(category: category),
                          ),
                        );
                      },
                    );
                  } else if (state is CategoriesError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sellers',
                    style: AppStyles.font18RegularBlackColor(context),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Show All',
                      style: AppStyles.font18RegularBlackColor(
                        context,
                      ).copyWith(color: AppColors.blueColor),
                    ),
                  ),
                ],
              ),
              BlocBuilder<VendorCubit, VendorState>(
                builder: (context, state) {
                  if (state is VendorLoading) {
                    return Skeletonizer(
                      enabled: true,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) => SellerCardItem(
                          imagePath: '',
                          name: '',
                          deliveryInfo: '',
                          distance: '',
                          category: '',
                        ), separatorBuilder: (BuildContext context, int index) => SizedBox(height: 7.h),
                      ),
                    );
                  } else if (state is VendorSuccess) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.vendors.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 7.h),
                      itemBuilder: (context, index) {
                        final vendor = state.vendors[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider(
                                      create: (context) =>
                                          sl<VendorProductsCubit>()
                                            ..getVendorProducts(vendor.id),
                                    ),
                                    BlocProvider(
                                      create: (context) => sl<CartCubit>(),
                                    ),
                                  ],
                                  child: SellerDetailsScreen(vendor: vendor),
                                ),
                              ),
                            );
                          },
                          child: SellerCardItem(
                            imagePath: vendor.image,
                            name: vendor.nameEn,
                            deliveryInfo: 'Delivery Charges : 0.5 KD',
                            distance: '2.5 KM',
                            category: 'Beverages',
                          ),
                        );
                      },
                    );
                  } else if (state is VendorError) {
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
