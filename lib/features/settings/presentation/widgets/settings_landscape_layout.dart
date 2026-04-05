import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/settings/presentation/widgets/settings_list_view.dart';
import 'package:fruits_app/features/user/presentation/widgets/image_photo.dart';
import 'package:go_router/go_router.dart';

class SettingsLandscapeLayout extends StatelessWidget {
  const SettingsLandscapeLayout({
    super.key,
    required this.list,
    required this.isTablet,
    required this.isLandscape,
    required this.userName,
    this.userImage,
    required this.isLoggedIn,
  });

  final List<Map<String, dynamic>> list;
  final bool isTablet;
  final bool isLandscape;
  final String userName;
  final String? userImage;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              ImagePhoto(imageUrl: userImage),
              SizedBox(height: 16.h),
              Text(
                'Welcome, $userName',
                textAlign: TextAlign.center,
                style: AppStyles.font24RegularBlackColor(
                  context,
                ).copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 20.h),
              CustomButtonWidget(
                width: 60.w,
                height: 30.sp,
                backgroundColor: isLoggedIn ? Colors.red : null,
                bordercolor: Colors.transparent,
                title: isLoggedIn ? 'Logout' : 'Login',
                textStyle: AppStyles.font18BoldWhiteColor(
                  context,
                ).copyWith(fontSize: 10.sp),
                onPressed: () {
                  if (isLoggedIn) {
                    // Logout Logic
                  } else {
                    GoRouter.of(context).push(AppRoute.loginScreen);
                  }
                },
              ),
            ],
          ),
        ),
        SizedBox(width: 30.w),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: SettingsListView(
              list: list,
              isTablet: isTablet,
              isLandscape: isLandscape,
            ),
          ),
        ),
      ],
    );
  }
}