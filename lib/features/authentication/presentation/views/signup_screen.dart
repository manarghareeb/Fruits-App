import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/authentication/presentation/widgets/auth_navigator_text.dart';
import 'package:fruits_app/features/authentication/presentation/widgets/custom_phone_field.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Fruit Market', style: AppStyles.font42BoldPrimaryColor),
                SizedBox(height: 21.h),
                Text(
                  'Sign Up to Wikala',
                  style: AppStyles.font28BoldBlackColor,
                ),
                SizedBox(height: 30.h),
                CustomTextFormField(
                  hintText: 'Enter your full name',
                  labelText: 'Full Name',
                  controller: nameController,
                  textInputType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                const CustomPhoneField(),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  hintText: 'Enter your password',
                  labelText: 'Password',
                  controller: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40.h),
                CustomButtonWidget(
                  title: 'Sign Up',
                  onPressed: () {
                    GoRouter.of(context).pushReplacement(AppRoute.loginScreen);
                  },
                ),
                SizedBox(height: 39.h),
                AuthNavigatorText(
                  text: 'Already have an account? ',
                  textButton: 'Login',
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRoute.loginScreen);
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
