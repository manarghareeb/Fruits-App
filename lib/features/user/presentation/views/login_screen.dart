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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String completePhoneNumber = "";

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserSuccess) {
          GoRouter.of(context).go(AppRoute.buttonNavigatorBar);
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
                        'Login to Wikala',
                        style: AppStyles.font28BoldBlackColor(context),
                      ),
                      SizedBox(height: 30.h),
                      CustomPhoneField(
                        controller: phoneController,
                        onChanged: (phone) {
                          completePhoneNumber = phone.completeNumber;
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
                      SizedBox(height: 17.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              GoRouter.of(
                                context,
                              ).push(AppRoute.forgetPasswordScreen);
                            },
                            child: Text(
                              'Forgot Password?',
                              style: AppStyles.font16RegularBlueColorUnderline(
                                context,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 21.h),
                      state is UserLoading
                          ? Skeletonizer(
                              enabled: true,
                              child: CustomButtonWidget(
                                  title: 'Login',
                                  onPressed: () {},
                                  backgroundColor: Colors.grey.shade300,
                                  textColor: Colors.transparent,
                                  bordercolor: Colors.transparent,
                                ),
                            )
                          : CustomButtonWidget(
                              title: 'Login',
                              onPressed: () {
                                if (phoneController.text.trim().isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Please enter your phone number',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                                if (completePhoneNumber.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Invalid phone number'),
                                    ),
                                  );
                                  return;
                                }
                                if (formKey.currentState!.validate()) {
                                  context.read<UserCubit>().login(
                                    email: completePhoneNumber,
                                    password: passwordController.text,
                                  );
                                }
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
          ),
        );
      },
    );
  }
}
