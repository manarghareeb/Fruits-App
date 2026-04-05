import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_image_card.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/features/basket/presentation/widgets/count_container.dart';
import 'package:fruits_app/features/categories/domain/entities/product_entity.dart';
import 'package:fruits_app/features/home/presentation/widgets/price_after_and_before_discount.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductCardItem extends StatelessWidget {
  const ProductCardItem({
    super.key,
    this.isCart = false,
    this.isFavorite = false,
    required this.productEntity,
  });

  final bool isCart;
  final bool isFavorite;
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 5.h,
                      ),
                      child: CustomImageCard(
                        imagePath: AppImages.farm,
                        isCircle: true,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productEntity.nameEn,
                            style: AppStyles.font16BoldBlackColor(
                              context,
                            ).copyWith(fontSize: isLandscape ? 10.sp : 16.sp),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              //Text('Price: '),
                              PriceAfterAndBeforeDiscount(
                                priceAfterDiscount: '', //'KD12.00',
                                priceBeforeDiscount:
                                    '${productEntity.price} KD',
                              ),
                            ],
                          ),
                          SizedBox(height: 9.h),
                          if (!isFavorite) ...[
                            Skeleton.replace(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 3.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.lightRedColor,
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Text(
                                  'Up to 10% Off',
                                  style:
                                      AppStyles.font12SemiBoldWhiteColor(
                                        context,
                                      ).copyWith(
                                        fontSize: isLandscape ? 6.sp : 12.sp,
                                      ),
                                ),
                              ),
                            ),
                          ] /*else
                            Text(
                              //'Store Name : Store 1',
                              '',
                              style:
                                  AppStyles.font16RegularDarkGreyColor(
                                    context,
                                  ).copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isLandscape ? 10.sp : 16.sp,
                                  ),
                            ),*/,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (isCart && !isFavorite)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        final cartCubit = context.read<CartCubit>();
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            title: const Text('Confirm Delete'),
                            content: const Text(
                              'Are you sure you want to remove this item from the cart?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, true);
                                  cartCubit.deleteItem(productEntity.id);
                                },
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.delete_forever,
                        color: AppColors.primaryColor,
                        size: isLandscape ? 15.sp : 28.sp,
                      ),
                    ),
                    SizedBox(height: 25.h),
                    CountContainer(
                      quantity: productEntity.cartQuantity,
                      onIncrement: () {
                        context.read<CartCubit>().incrementQuantity(
                          productEntity,
                        );
                      },
                      onDecrement: () {
                        context.read<CartCubit>().decrementQuantity(
                          productEntity,
                        );
                      },
                    ),
                  ],
                )
              else if (!isCart)
                Skeleton.replace(
                  child: Container(
                    width: isLandscape ? 30.w : 55.w,
                    height: isLandscape ? 30.w : 50.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.read<CartCubit>().addProduct(productEntity);
                        GoRouter.of(
                          context,
                        ).push(AppRoute.buttonNavigatorBar, extra: 2);
                      },
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.white,
                        size: isLandscape ? 18.sp : 23.sp,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (isCart && isFavorite)
          Positioned(
            top: 10.h,
            right: 10.w,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: isLandscape ? 15.w : 30.w,
                height: isLandscape ? 15.w : 30.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 4,
                      color: AppColors.blackColor.withOpacity(0.25),
                    ),
                  ],
                ),
                child: Icon(Icons.close, size: isLandscape ? 15.sp : 20.sp),
              ),
            ),
          ),
      ],
    );
  }
}
