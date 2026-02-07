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
    final isTablet = AppResponsive.isTablet(context);
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
                  style: AppStyles.font42BoldPrimaryColor(context),
                ),
                SizedBox(height: 21.h),
                Text(
                  'Welcome to Our app',
                  style: AppStyles.font28BoldBlackColor(context),
                ),
                SizedBox(height: 52.h),
                CustomButtonWidget(
                  title: 'Sign in with Phone Number',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  bordercolor: Colors.transparent,
                  textColor: AppColors.lightBlackColor,
                  icon: Icons.phone,
                  textStyle: AppStyles.font14RegularDarkGreyColor(context),
                ),
                SizedBox(height: 21.h),
                CustomButtonWidget(
                  height: isLandscape ? (isTablet ? 75.h : 50.h) : 50.h,
                  title: 'Sign in with Google',
                  onPressed: () {},
                  backgroundColor: Colors.white,
                  bordercolor: Colors.transparent,
                  textColor: AppColors.lightBlackColor,
                  svgPath: AppImages.googleLogo,
                  textStyle: AppStyles.font14RegularDarkGreyColor(context),
                ),
                SizedBox(height: 21.h),
                CustomButtonWidget(
                  title: 'Sign in with Facebook',
                  onPressed: () {},
                  backgroundColor: AppColors.blueColor,
                  bordercolor: Colors.transparent,
                  icon: Icons.facebook,
                  textStyle: AppStyles.font14RegularDarkGreyColor(
                    context,
                  ).copyWith(color: Colors.white),
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
                    style: AppStyles.font16RegularGreyColor(context),
                    children: [
                      TextSpan(
                        text: 'Terms of service ',
                        style: AppStyles.font16RegularBlueColorUnderline(
                          context,
                        ),
                      ),
                      TextSpan(
                        text: 'and our ',
                        style: AppStyles.font16RegularGreyColor(context),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: AppStyles.font16RegularBlueColorUnderline(
                          context,
                        ),
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
