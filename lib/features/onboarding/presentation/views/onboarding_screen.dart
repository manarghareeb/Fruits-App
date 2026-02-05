import 'package:flutter/material.dart';
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
