import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/di/service_locator.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/favorite/presentation/cubit/add_or_remove_favorite_cubit/add_or_remove_favorite_cubit.dart';
import 'package:fruits_app/features/favorite/presentation/cubit/get_favorites_cubit/get_favorites_cubit.dart';
import 'package:fruits_app/features/favorite/presentation/cubit/get_favorites_cubit/get_favorites_state.dart';
import 'package:fruits_app/features/home/presentation/views/product_details_screen.dart';
import 'package:fruits_app/features/home/presentation/widgets/product_card_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    context.read<GetFavoritesCubit>().getFavorites();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Favorite'),
      body: BlocBuilder<GetFavoritesCubit, GetFavoritesState>(
        builder: (context, state) {
          if (state is GetFavoritesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetFavoritesSuccess) {
            final favorites = state.favorites
                .where((e) => e.product != null)
                .toList();
            if (favorites.isEmpty) {
              return const Center(
                child: Text('The favorites list is now empty'),
              );
            }
            return Padding(
              padding: isLandscape
                  ? EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w)
                  : EdgeInsets.symmetric(vertical: 13.h, horizontal: 15.w),
              child: isLandscape
                  ? GridView.builder(
                      itemCount: favorites.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 4.h,
                      ),
                      itemBuilder: (context, index) {
                        final item = favorites[index].product!;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) =>
                                        sl<AddOrRemoveFavoriteCubit>(),
                                    child: ProductDetailsScreen(
                                      productEntity: item,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: ProductCardItem(
                              price: '${item.price}',
                              productName: item.nameEn,
                              imagePath: AppImages.fruitsImage,
                              isCart: true,
                              isFavorite: true,
                            ),
                          ),
                        );
                      },
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.h,
                        horizontal: 4.w,
                      ),
                      itemCount: favorites.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 7.h),
                      itemBuilder: (context, index) {
                        final item = favorites[index].product!;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) =>
                                      sl<AddOrRemoveFavoriteCubit>(),
                                  child: ProductDetailsScreen(
                                    productEntity: item,
                                  ),
                                ),
                              ),
                            );
                          },
                          child: ProductCardItem(
                            price: '${item.price}',
                            productName: item.nameEn,
                            imagePath: AppImages.fruitsImage,
                            isCart: true,
                            isFavorite: true,
                          ),
                        );
                      },
                    ),
            );
          } else if (state is GetFavoritesError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
