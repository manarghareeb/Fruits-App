import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/di/service_locator.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';
import 'package:fruits_app/features/favorite/presentation/cubit/add_or_remove_favorite_cubit/add_or_remove_favorite_cubit.dart';
import 'package:fruits_app/features/favorite/presentation/cubit/add_or_remove_favorite_cubit/add_or_remove_favorite_state.dart';
import 'package:fruits_app/features/home/presentation/widgets/image_banner_section.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_details_body.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_header_section.dart';
import 'package:go_router/go_router.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    //final isTablet = AppResponsive.isTablet(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AddOrRemoveFavoriteCubit>()),
        BlocProvider(create: (context) => sl<CartCubit>()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          isLeading: true,
          title: productEntity.nameEn,
          actions: [
            BlocConsumer<AddOrRemoveFavoriteCubit, AddOrRemoveFavoriteState>(
              listener: (context, state) {
                if (state is AddOrRemoveFavoriteSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Added to favorites successfully'),
                    ),
                  );
                  GoRouter.of(
                    context,
                  ).push(AppRoute.buttonNavigatorBar, extra: 3);
                } else if (state is AddOrRemoveFavoriteError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              builder: (context, state) {
                return IconButton(
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    size: isLandscape ? 15.sp : 20.sp,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    context.read<AddOrRemoveFavoriteCubit>().toggleFavorite(
                      productEntity.id.toString(),
                    );
                  },
                );
              },
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.shareFromSquare,
                color: Colors.black,
                size: isLandscape ? 15.sp : 20.sp,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? 25.w : 21.w,
              vertical: isLandscape ? 10.h : 17.h,
            ),
            child: isLandscape
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 2, child: ImageBannerSection()),
                      SizedBox(width: 20.w),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProductHeaderSection(
                              productName: '',
                              categoryName: '',
                              priceAfterDiscount: '',
                              priceBeforeDiscount: '',
                            ),
                            SizedBox(height: 8.h),
                            ProductDetailsBody(productEntity: productEntity),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ImageBannerSection(),
                      SizedBox(height: 10.h),
                      ProductDetailsBody(productEntity: productEntity),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
