import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/authentication/presentation/widgets/custom_phone_field.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '', isLeading: true),
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
                  'Enter your number',
                  style: AppStyles.font28BoldBlackColor(context),
                ),
                SizedBox(height: 28.h),
                CustomPhoneField(),
                SizedBox(height: 48.h),
                CustomButtonWidget(
                  title: 'Submit',
                  onPressed: () {
                    GoRouter.of(context).push(AppRoute.verificationScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
