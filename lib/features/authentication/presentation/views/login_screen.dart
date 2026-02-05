import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/authentication/presentation/widgets/auth_navigator_text.dart';
import 'package:fruits_app/features/authentication/presentation/widgets/custom_phone_field.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
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
                Text('Login to Wikala', style: AppStyles.font28BoldBlackColor),
                SizedBox(height: 30.h),
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
                SizedBox(height: 17.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRoute.forgetPasswordScreen);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: AppStyles.font18RegularBlueColorUnderline,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 21.h),
                CustomButtonWidget(
                  title: 'Login',
                  onPressed: () {
                    GoRouter.of(context).go(AppRoute.buttonNavigatorBar);
                  },
                ),
                SizedBox(height: 35.h),
                AuthNavigatorText(
                  text: 'Don\'t have an account? ',
                  textButton: 'Sign Up',
                  onTap: () {
                    GoRouter.of(context).push(AppRoute.signupScreen);
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
