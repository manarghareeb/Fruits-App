import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/authentication/presentation/widgets/auth_navigator_text.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    final screenWidth = AppResponsive.screenWidth(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black, size: 20.sp),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(AppRoute.onBoardingScreen);
            }
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Fruit Market',
                  style: isLandscape
                      ? AppStyles.font42BoldPrimaryColor.copyWith(
                          fontSize: 32.sp,
                        )
                      : AppStyles.font42BoldPrimaryColor,
                ),
                SizedBox(height: 21.h),
                Text(
                  'Welcome to Our app',
                  style: isLandscape
                      ? AppStyles.font28BoldBlackColor.copyWith(fontSize: 18.sp)
                      : AppStyles.font28BoldBlackColor,
                ),
                SizedBox(height: 52.h),
                CustomButtonWidget(
                  width: screenWidth * 0.7,
                  title: 'Sign in with Phone Number',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  bordercolor: Colors.transparent,
                  textColor: AppColors.lightBlackColor,
                  icon: Icons.phone,
                  textStyle: isLandscape
                      ? AppStyles.font14RegularDarkGreyColor.copyWith(
                          fontSize: 10.sp,
                        )
                      : AppStyles.font14RegularDarkGreyColor,
                ),
                SizedBox(height: 21.h),
                CustomButtonWidget(
                  width: screenWidth * 0.7,
                  title: 'Sign in with Google',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  bordercolor: Colors.transparent,
                  textColor: AppColors.lightBlackColor,
                  svgPath: AppImages.googleLogo,
                  textStyle: isLandscape
                      ? AppStyles.font14RegularDarkGreyColor.copyWith(
                          fontSize: 10.sp,
                        )
                      : AppStyles.font14RegularDarkGreyColor,
                ),
                SizedBox(height: 21.h),
                CustomButtonWidget(
                  width: screenWidth * 0.7,
                  title: 'Sign in with Facebook',
                  onPressed: () {},
                  backgroundColor: AppColors.blueColor,
                  bordercolor: Colors.transparent,
                  icon: Icons.facebook,
                  textStyle: isLandscape
                      ? AppStyles.font14RegularDarkGreyColor.copyWith(
                          color: Colors.white,
                          fontSize: 10.sp,
                        )
                      : AppStyles.font14RegularDarkGreyColor.copyWith(
                          color: Colors.white,
                        ),
                ),
                SizedBox(height: 79.h),
                AuthNavigatorText(
                  text: 'Already member? ',
                  textButton: 'Sign In',
                  onTap: () {
                    GoRouter.of(context).push(AppRoute.loginScreen);
                  },
                ),
                SizedBox(height: 58.h),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By continue you agree to our ',
                    style: AppStyles.font18RegularGreyColor.copyWith(
                      fontSize: isLandscape ? 12.sp : 16.sp,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms of service ',
                        style: AppStyles.font18RegularBlueColorUnderline
                            .copyWith(fontSize: isLandscape ? 12.sp : 16.sp),
                      ),
                      TextSpan(
                        text: 'and our ',
                        style: AppStyles.font18RegularGreyColor.copyWith(
                          fontSize: isLandscape ? 12.sp : 16.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: AppStyles.font18RegularBlueColorUnderline
                            .copyWith(fontSize: isLandscape ? 12.sp : 16.sp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/authentication/presentation/widgets/auth_navigator_text.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    //final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(AppRoute.onBoardingScreen);
            }
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isLandscape ? screenWidth * 0.1 : 24.w,
              vertical: isLandscape ? 16.h : 24.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                Text(
                  'Fruit Market',
                  style: isLandscape
                      ? AppStyles.font28BoldBlackColor.copyWith(
                        color: AppColors.primaryColor
                      )
                      : AppStyles.font42BoldPrimaryColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isLandscape ? 12.h : 21.h),

                // Subtitle
                Text(
                  'Welcome to Our app',
                  style: isLandscape
                      ? AppStyles.font24RegularBlackColor
                      : AppStyles.font28BoldBlackColor,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: isLandscape ? 32.h : 52.h),

                // Buttons
                CustomButtonWidget(
                  title: 'Sign in with Phone Number',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  bordercolor: Colors.transparent,
                  textColor: AppColors.lightBlackColor,
                  icon: Icons.phone,
                  textStyle: isLandscape
                      ? AppStyles.font14RegularDarkGreyColor
                      : AppStyles.font14RegularDarkGreyColor,
                  width: isLandscape ? screenWidth * 0.5 : double.infinity,
                ),
                SizedBox(height: isLandscape ? 12.h : 21.h),
                CustomButtonWidget(
                  title: 'Sign in with Google',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  bordercolor: Colors.transparent,
                  textColor: AppColors.lightBlackColor,
                  svgPath: AppImages.googleLogo,
                  textStyle: isLandscape
                      ? AppStyles.font14RegularDarkGreyColor
                      : AppStyles.font14RegularDarkGreyColor,
                  width: isLandscape ? screenWidth * 0.5 : double.infinity,
                ),
                SizedBox(height: isLandscape ? 12.h : 21.h),
                CustomButtonWidget(
                  title: 'Sign in with Facebook',
                  onPressed: () {},
                  backgroundColor: AppColors.blueColor,
                  bordercolor: Colors.transparent,
                  icon: Icons.facebook,
                  textStyle: AppStyles.font14RegularDarkGreyColor.copyWith(
                    color: Colors.white,
                  ),
                  width: isLandscape ? screenWidth * 0.5 : double.infinity,
                ),
                SizedBox(height: isLandscape ? 48.h : 79.h),

                // Navigator text
                AuthNavigatorText(
                  text: 'Already member? ',
                  textButton: 'Sign In',
                  onTap: () {
                    GoRouter.of(context).push(AppRoute.loginScreen);
                  },
                ),
                SizedBox(height: isLandscape ? 32.h : 58.h),

                // Terms & Privacy
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By continue you agree to our ',
                    style: isLandscape
                        ? AppStyles.font16RegularDarkGreyColor
                        : AppStyles.font18RegularGreyColor,
                    children: [
                      TextSpan(
                        text: 'Terms of service ',
                        style: isLandscape
                            ? AppStyles.font18RegularBlueColorUnderline.copyWith(
                              fontSize: 16.sp
                            )
                            : AppStyles.font18RegularBlueColorUnderline,
                      ),
                      TextSpan(
                        text: 'and our ',
                        style: isLandscape
                            ? AppStyles.font16RegularDarkGreyColor
                            : AppStyles.font18RegularGreyColor,
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: isLandscape
                            ? AppStyles.font18RegularBlueColorUnderline.copyWith(
                              fontSize: 16.sp
                            )
                            : AppStyles.font18RegularBlueColorUnderline,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
