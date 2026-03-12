import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_cubit.dart';
import 'package:fruits_app/features/basket/presentation/cubit/cart_state.dart';
import 'package:fruits_app/features/basket/presentation/widgets/basket_landscape_layout.dart';
import 'package:fruits_app/features/basket/presentation/widgets/basket_portrait_layout.dart';
import 'package:fruits_app/features/basket/presentation/widgets/button_navigator_bar_in_portrait.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'Basket'),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            if (state.products.isEmpty) {
              return const Center(child: Text("Your cart is empty"));
            }
            final List<Map<String, String>> priceDetails = [
              {
                'title': 'Subtotal',
                'value': '${state.totalPrice.toStringAsFixed(2)} KD',
              },
              {'title': 'Shipping Charges', 'value': '1.50 KD'},
              {
                'title': 'Bag Total',
                'value': '${(state.totalPrice + 1.5).toStringAsFixed(2)} KD',
              },
            ];
            return isLandscape
                ? BasketLandscapeLayout(
                    orderDetails: priceDetails,
                    products: state.products,
                    countItem: state.products.length,
                    priceCart: (state.totalPrice + 1.5).toStringAsFixed(2),
                  )
                : SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      vertical: 13.h,
                      horizontal: 15.w,
                    ),
                    child: BasketPortraitLayout(
                      products: state.products,
                    ),
                  );
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: isLandscape
          ? null
          : const ButtonNavigatorBarInPortrait(),
    );
  }
}
