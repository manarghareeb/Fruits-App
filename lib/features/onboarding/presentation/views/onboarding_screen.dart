import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_smooth_page_indicator.dart';
import 'package:fruits_app/features/onboarding/presentation/widgets/page_view_body.dart';
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
                        style: AppStyles.font14RegularDarkGreyColor(context)
                            .copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.lightBlackColor,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: isLandscape
                    ? isTable
                          ? 10.h
                          : 0.h
                    : 20.h,
              ),
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
                    return PageViewBody(page: page);
                  },
                ),
              ),
              SizedBox(height: isLandscape ? 16.h : 53.h),
              CustomSmoothPageIndicator(
                controller: controller,
                count: pages.length,
              ),
              SizedBox(height: isLandscape ? 16.h : 87.h),
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
                textStyle: AppStyles.font18BoldBlackColor(context).copyWith(
                  color: Colors.white,
                  fontSize: isLandscape ? 10.sp : 14.sp,
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
