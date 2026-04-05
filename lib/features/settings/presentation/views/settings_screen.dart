import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_selector_dialog.dart';
import 'package:fruits_app/features/settings/presentation/widgets/settings_landscape_layout.dart';
import 'package:fruits_app/features/settings/presentation/widgets/settings_portrait_layout.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_state.dart';
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
        'onTap': () {},
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
                ? SettingsLandscapeLayout(
                    key: const ValueKey('landscape'),
                    list: list,
                    isTablet: isTablet,
                    isLandscape: isLandscape,
                    userName: userName,
                    userImage: userImage,
                    isLoggedIn: isLoggedIn,
                  )
                : SettingsPortraitLayout(
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
