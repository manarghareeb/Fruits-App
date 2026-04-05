import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/settings/presentation/widgets/settings_list_view.dart';
import 'package:fruits_app/features/user/presentation/widgets/image_photo.dart';
import 'package:go_router/go_router.dart';

class SettingsPortraitLayout extends StatelessWidget {
  const SettingsPortraitLayout({
    super.key,
    required this.isLandscape,
    required this.list,
    required this.isTablet,
    required this.userName,
    this.userImage,
    required this.isLoggedIn,
  });

  final bool isLandscape;
  final List<Map<String, dynamic>> list;
  final bool isTablet;
  final String userName;
  final String? userImage;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
        child: Column(
          children: [
            ImagePhoto(imageUrl: userImage),
            SizedBox(height: 16.h),
            Text(
              'Welcome, $userName',
              style: AppStyles.font24RegularBlackColor(context),
            ),
            SizedBox(height: 28.h),
            CustomButtonWidget(
              height: isLandscape ? 30.sp : 40.sp,
              backgroundColor: isLoggedIn ? Colors.red : null,
              bordercolor: Colors.transparent,
              title: isLoggedIn ? 'Logout' : 'Login',
              textStyle: AppStyles.font18BoldWhiteColor(context),
              onPressed: () {
                if (isLoggedIn) {
                  // context.read<AuthCubit>().logout();
                } else {
                  GoRouter.of(context).push(AppRoute.loginScreen);
                }
              },
            ),
            SizedBox(height: 18.h),
            SettingsListView(
              list: list,
              isTablet: isTablet,
              isLandscape: isLandscape,
            ),
          ],
        ),
      ),
    );
  }
}