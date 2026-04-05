import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_state.dart';
import 'package:fruits_app/features/user/presentation/widgets/auth_navigator_text.dart';
import 'package:fruits_app/features/user/presentation/widgets/custom_phone_field.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  String completePhoneNumber = '';

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    emailController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account created successfully!')),
          );
          GoRouter.of(context).pushReplacement(AppRoute.loginScreen);
        } else if (state is UserFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(title: '', isLeading: true),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Fruit Market',
                        style: AppStyles.font42BoldPrimaryColor(context),
                      ),
                      SizedBox(height: 21.h),
                      Text(
                        'Sign Up to Wikala',
                        style: AppStyles.font28BoldBlackColor(context),
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
                      CustomPhoneField(
                        controller: phoneController,
                        onChanged: (phone) {
                          completePhoneNumber = phone.completeNumber;
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        hintText: 'Enter your Email',
                        labelText: 'Email',
                        controller: emailController,
                        textInputType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
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
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        hintText: 'Confirm your password',
                        labelText: 'Confirm Password',
                        controller: confirmPasswordController,
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
                      state is UserLoading
                          ? Skeletonizer(
                              enabled: true,
                              child: CustomButtonWidget(
                                  title: 'Sign Up',
                                  onPressed: () {},
                                  backgroundColor: Colors.grey.shade300,
                                  textColor: Colors.transparent,
                                  bordercolor: Colors.transparent,
                                ),
                            )
                          : CustomButtonWidget(
                              title: 'Sign Up',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<UserCubit>().register(
                                    name: nameController.text,
                                    email: emailController.text,
                                    mobile: completePhoneNumber,
                                    password: passwordController.text,
                                    confirmPassword:
                                        confirmPasswordController.text,
                                  );
                                }
                              },
                            ),
                      SizedBox(height: 39.h),
                      AuthNavigatorText(
                        text: 'Already have an account? ',
                        textButton: 'Login',
                        onTap: () {
                          GoRouter.of(
                            context,
                          ).pushReplacement(AppRoute.loginScreen);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
