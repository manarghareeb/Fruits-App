import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/features/basket/presentation/views/basket_screen.dart';
import 'package:fruits_app/features/favorite/presentation/views/favorite_screen.dart';
import 'package:fruits_app/features/home/presentation/views/home_screen.dart';
import 'package:fruits_app/features/order/presentation/views/order_screen.dart';
import 'package:fruits_app/features/settings/presentation/views/settings_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ButtonNavigatorBar extends StatefulWidget {
  const ButtonNavigatorBar({super.key, this.initialIndex = 0});
  final int initialIndex;

  @override
  State<ButtonNavigatorBar> createState() => _ButtonNavigatorBarState();
}

class _ButtonNavigatorBarState extends State<ButtonNavigatorBar> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    HomeScreen(),
    OrderScreen(),
    BasketScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    final isLanscape = AppResponsive.isLandscape(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: SafeArea(
        bottom: true,
        minimum: EdgeInsets.only(bottom: 4.h),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 11.h),
            child: GNav(
              gap: 3.5.w,
              activeColor: AppColors.primaryColor,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 11.h),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.white,
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              tabs: [
                GButton(
                  icon: FontAwesomeIcons.home,
                  iconSize: isLanscape ? 15.sp : 20.sp,
                  text: 'Home',
                  textStyle: AppStyles.font16BoldPrimaryColor(context),
                  textColor: AppColors.primaryColor,
                ),
                GButton(
                  icon: FontAwesomeIcons.listNumeric,
                  iconSize: isLanscape ? 15.sp : 20.sp,
                  text: 'Order',
                  textStyle: AppStyles.font16BoldPrimaryColor(context),
                  textColor: AppColors.primaryColor,
                ),
                GButton(
                  icon: FontAwesomeIcons.basketShopping,
                  iconSize: isLanscape ? 15.sp : 20.sp,
                  text: 'Basket',
                  textStyle: AppStyles.font16BoldPrimaryColor(context),
                  textColor: AppColors.primaryColor,
                ),
                GButton(
                  icon: Icons.favorite_border_outlined,
                  iconSize: isLanscape ? 15.sp : 20.sp,
                  text: 'Favorite',
                  textStyle: AppStyles.font16BoldPrimaryColor(context),
                  textColor: AppColors.primaryColor,
                ),
                GButton(
                  icon: FontAwesomeIcons.listUl,
                  iconSize: isLanscape ? 15.sp : 20.sp,
                  text: 'More',
                  textStyle: AppStyles.font16BoldPrimaryColor(context),
                  textColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
