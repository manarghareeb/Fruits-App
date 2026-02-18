import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_selector_dialog.dart';
import 'package:fruits_app/features/settings/presentation/widgets/image_photo.dart';
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
        'icon': FontAwesomeIcons.circleInfo,
        'title': 'About Us',
        'onTap': () => GoRouter.of(context).push(AppRoute.aboutUsScreen),
      },
    ];

    final isLandscape = AppResponsive.isLandscape(context);
    final isTablet = AppResponsive.isTablet(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: isLandscape
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const ImagePhoto(),
                      SizedBox(height: 16.h),
                      Text(
                        'Welcome, Fruit Market',
                        textAlign: TextAlign.center,
                        style: AppStyles.font24RegularBlackColor(
                          context,
                        ).copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 20.h),
                      CustomButtonWidget(
                        width: 60.w,
                        height: 30.sp,
                        title: 'Login',
                        textStyle: AppStyles.font18BoldWhiteColor(
                          context,
                        ).copyWith(fontSize: 10.sp),
                        onPressed: () =>
                            GoRouter.of(context).push(AppRoute.loginScreen),
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
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 8.w,
                  vertical: 16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ImagePhoto(),
                    SizedBox(height: 16.h),
                    Text(
                      'Welcome, Fruit Market',
                      style: AppStyles.font24RegularBlackColor(context),
                    ),
                    SizedBox(height: 28.h),
                    CustomButtonWidget(
                      height: isLandscape ? 30.sp : 40.sp,
                      title: 'Login',
                      textStyle: AppStyles.font18BoldWhiteColor(context),
                      onPressed: () {
                        GoRouter.of(context).push(AppRoute.loginScreen);
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
            ),
    );
  }
}

class SettingsListView extends StatelessWidget {
  const SettingsListView({
    super.key,
    required this.list,
    required this.isTablet,
    required this.isLandscape,
  });

  final List<Map<String, dynamic>> list;
  final bool isTablet;
  final bool isLandscape;
  //final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final item = list[index];
        return ListTile(
          onTap: item['onTap'],
          leading: Icon(
            item['icon'],
            color: AppColors.primaryColor,
            size: isTablet ? 10.sp : 15.sp,
          ),
          title: Text(
            item['title'],
            style: AppStyles.font14RegularBlackColor(context),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: isLandscape ? 10.sp : 15.sp,
            color: AppColors.greyColor,
          ),
        );
      },
    );
  }
}
