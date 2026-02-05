import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/theme/colors.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
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
            tabs: const [
              GButton(
                icon: FontAwesomeIcons.home,
                text: 'Home',
                textColor: AppColors.primaryColor,
              ),
              GButton(
                icon: FontAwesomeIcons.listNumeric,
                text: 'Order',
                textColor: AppColors.primaryColor,
              ),
              GButton(
                icon: FontAwesomeIcons.basketShopping,
                text: 'Basket',
                textColor: AppColors.primaryColor,
              ),
              GButton(
                icon: Icons.favorite_border_outlined,
                text: 'Favorite',
                textColor: AppColors.primaryColor,
              ),
              GButton(
                icon: FontAwesomeIcons.listUl,
                text: 'More',
                textColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}