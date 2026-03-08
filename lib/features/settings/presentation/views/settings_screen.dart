import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_selector_dialog.dart';
import 'package:fruits_app/features/settings/presentation/widgets/settings_list_view.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_state.dart';
import 'package:fruits_app/features/user/presentation/widgets/image_photo.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> list = [
      {
        'icon': FontAwesomeIcons.user,
        'title': 'Profile',
        'onTap': () => GoRouter.of(context).push(AppRoute.profileScreen),
      },
      {
        'icon': FontAwesomeIcons.list12,
        'title': 'My Orders',
        'onTap': () =>
            GoRouter.of(context).push(AppRoute.buttonNavigatorBar, extra: 1),
      },
      {
        'icon': Icons.favorite_outline,
        'title': 'Favorite',
        'onTap': () =>
            GoRouter.of(context).push(AppRoute.buttonNavigatorBar, extra: 3),
      },
      {
        'icon': Icons.language,
        'title': 'Language',
        'onTap': () => showDialog(
          context: context,
          builder: (context) => CustomSelectionDialog(
            initialValue: 'English',
            options: [
              {
                'title': 'العربية',
                'value': 'Arabic',
                'icon': AppImages.saFlagSVG,
              },
              {
                'title': 'English',
                'value': 'English',
                'icon': AppImages.usFlagSVG,
              },
            ],
            onApply: (val) => print(val),
          ),
        ),
      },
      {
        'icon': FontAwesomeIcons.headphones,
        'title': 'Support',
        'onTap': () => GoRouter.of(context).push(AppRoute.supportScreen),
      },
      {
        'icon': FontAwesomeIcons.handshake,
        'title': 'Terms & Conditions',
        'onTap': () =>
            GoRouter.of(context).push(AppRoute.termsAndConditionsScreen),
      },
      {
        'icon': FontAwesomeIcons.circleQuestion,
        'title': 'About Us',
        'onTap': () => GoRouter.of(context).push(AppRoute.aboutUsScreen),
      },
      {
        'icon': FontAwesomeIcons.headset,
        'title': 'Contact Us',
        'onTap': () => GoRouter.of(context).push(AppRoute.contactUsScreen),
      },
    ];

    final isLandscape = AppResponsive.isLandscape(context);
    final isTablet = AppResponsive.isTablet(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          String userName = 'Fruit Market';
          String? userImage;
          bool isLoggedIn = false;

          if (state is UserSuccess) {
            userName = state.userEntity.name;
            userImage = state.userEntity.profilePhotoUrl;
            isLoggedIn = true;
          }

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isLandscape
                ? LandscapeLayout(
                    key: const ValueKey('landscape'),
                    list: list,
                    isTablet: isTablet,
                    isLandscape: isLandscape,
                    userName: userName,
                    userImage: userImage,
                    isLoggedIn: isLoggedIn,
                  )
                : PortraitLayout(
                    key: const ValueKey('portrait'),
                    isLandscape: isLandscape,
                    list: list,
                    isTablet: isTablet,
                    userName: userName,
                    userImage: userImage,
                    isLoggedIn: isLoggedIn,
                  ),
          );
        },
      ),
    );
  }
}

class PortraitLayout extends StatelessWidget {
  const PortraitLayout({
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

class LandscapeLayout extends StatelessWidget {
  const LandscapeLayout({
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
