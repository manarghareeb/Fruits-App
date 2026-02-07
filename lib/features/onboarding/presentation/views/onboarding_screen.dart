/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_smooth_page_indicator.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int index = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'E Shopping',
      'subtitle': 'Explore op organic fruits & grab them',
      'button': 'Next',
    },
    {
      'title': 'Delivery Arrived',
      'subtitle': 'Order is arrived at your Place',
      'button': 'Next',
    },
    {
      'title': 'Delivery Arrived',
      'subtitle': 'Order is arrived at your Place',
      'button': 'Get Started',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Opacity(
                  opacity: index == pages.length - 1 ? 0.0 : 1.0,
                  child: TextButton(
                    onPressed: () {
                      if (index != pages.length - 1) {
                        GoRouter.of(context).go(AppRoute.welcomeScreen);
                      }
                    },
                    child: Text(
                      'Skip',
                      style: AppStyles.font14RegularDarkGreyColor.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.lightBlackColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.59,
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                onPageChanged: (pageIndex) {
                  setState(() {
                    index = pageIndex;
                  });
                },
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 61.w),
                        SizedBox(
                          width: 285.w,
                          height: 273.h,
                          child: Image.asset(
                            AppImages.onboarding,
                            fit: BoxFit.fill,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Column(
                          children: [
                            Text(
                              page['title']!,
                              textAlign: TextAlign.center,
                              style: AppStyles.font28BoldBlackColor,
                            ),
                            SizedBox(height: 17.h),
                            Text(
                              page['subtitle']!,
                              textAlign: TextAlign.center,
                              style: AppStyles.font14RegularGreyColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 53.h),
            CustomSmoothPageIndicator(
              controller: controller,
              count: pages.length,
            ),
            SizedBox(height: 87.h),
            pages[index]['button'] == 'Get Started'
                ? CustomButtonWidget(
                    width: 170.w,
                    title: pages[index]['button']!,
                    onPressed: () async {
                      GoRouter.of(context).go(AppRoute.welcomeScreen);
                    },
                  )
                : CustomButtonWidget(
                    width: 170.w,
                    title: pages[index]['button']!,
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_smooth_page_indicator.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int index = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'E Shopping',
      'subtitle': 'Explore op organic fruits & grab them',
      'button': 'Next',
    },
    {
      'title': 'Delivery Arrived',
      'subtitle': 'Order is arrived at your Place',
      'button': 'Next',
    },
    {
      'title': 'Delivery Arrived',
      'subtitle': 'Order is arrived at your Place',
      'button': 'Get Started',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    final isTable = AppResponsive.isTablet(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              // Skip Button Row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Opacity(
                    opacity: index == pages.length - 1 ? 0.0 : 1.0,
                    child: TextButton(
                      onPressed: () {
                        if (index != pages.length - 1) {
                          GoRouter.of(context).go(AppRoute.welcomeScreen);
                        }
                      },
                      child: Text(
                        'Skip',
                        style: isLandscape ? AppStyles.font14RegularDarkGreyColor.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.lightBlackColor,
                          fontSize: 10.sp
                        ) : AppStyles.font14RegularDarkGreyColor.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.lightBlackColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: isLandscape ? isTable ? 10.h : 0.h : 20.h),

              // PageView
              Expanded(
                flex: isLandscape ? 2 : 6,
                child: PageView.builder(
                  controller: controller,
                  itemCount: pages.length,
                  onPageChanged: (pageIndex) {
                    setState(() {
                      index = pageIndex;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: isLandscape ? 20.h : 60.h),
                          // Image
                          SizedBox(
                            width: isTable ? 370.w : 275.w,
                            height: isLandscape ? isTable ? 370.h : 170.h : 273.h,
                            child: Image.asset(
                              AppImages.onboarding,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: isLandscape ? 16.h : 30.h),

                          // Texts
                          Text(
                            page['title']!,
                            textAlign: TextAlign.center,
                            style: isLandscape ? AppStyles.font28BoldBlackColor.copyWith(
                              fontSize: isTable ? 20.sp : 13.sp
                            ) : AppStyles.font28BoldBlackColor,
                          ),
                          SizedBox(height: isLandscape ? 12.h : 17.h),
                          Text(
                            page['subtitle']!,
                            textAlign: TextAlign.center,
                            style: isLandscape ? AppStyles.font14RegularGreyColor.copyWith(
                              fontSize: isTable ? 10.sp : 8.sp
                            ) : AppStyles.font14RegularGreyColor,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Page Indicator
              SizedBox(height: isLandscape ? 16.h : 53.h),
              CustomSmoothPageIndicator(
                controller: controller,
                count: pages.length,
              ),
              SizedBox(height: isLandscape ? 16.h : 87.h),

              // Button
              CustomButtonWidget(
                width: isLandscape ? 100.w : 177.w,
                height: isLandscape ? (isTable ? 75.h : 50.h) : 50.h,
                title: pages[index]['button']!,
                onPressed: () {
                  if (pages[index]['button'] == 'Get Started') {
                    GoRouter.of(context).go(AppRoute.welcomeScreen);
                  } else {
                    controller.nextPage(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                textStyle: isLandscape
                    ? AppStyles.font18BoldWhiteColor.copyWith(fontSize: 10.sp)
                    : AppStyles.font18BoldBlackColor.copyWith(
                        color: Colors.white,
                      ),
              ),
              SizedBox(height: isLandscape ? 10.h : 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
