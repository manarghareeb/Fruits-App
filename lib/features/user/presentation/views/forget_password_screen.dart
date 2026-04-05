import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_state.dart';
import 'package:fruits_app/features/user/presentation/widgets/custom_phone_field.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  String completePhoneNumber = "";

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    'Enter your number',
                    style: AppStyles.font28BoldBlackColor(context),
                  ),
                  SizedBox(height: 28.h),
                  CustomPhoneField(
                    controller: phoneController,
                    onChanged: (phone) {
                      completePhoneNumber = phone.completeNumber;
                    },
                  ),
                  SizedBox(height: 48.h),
                  BlocConsumer<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state is UserFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        children: [
                          if (state is UserLoading)
                            Skeletonizer(
                              enabled: true,
                              child: CustomButtonWidget(
                                  title: 'Login',
                                  onPressed: () {},
                                  backgroundColor: Colors.grey.shade300,
                                  textColor: Colors.transparent,
                                  bordercolor: Colors.transparent,
                                ),
                            )
                          else
                            CustomButtonWidget(
                              title: 'Submit',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<UserCubit>().forgetPassword(
                                    phone: completePhoneNumber,
                                  );
                                }
                              },
                            ),
                          if (state is UserSuccess) ...[
                            SizedBox(height: 32.h),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(16.r),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.r),
                                border: Border.all(color: Colors.green),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Your New Password',
                                    style: AppStyles.font18BoldBlackColor(
                                      context,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    state.userEntity.newPassword?.toString() ??
                                        "N/A",
                                    style: AppStyles.font24BoldPrimaryColor(
                                      context,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    'Please save this password to login',
                                    style: AppStyles.font14RegularDarkGreyColor(
                                      context,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 24.h),
                            CustomButtonWidget(
                              title: 'Back to Login',
                              onPressed: () => context.go(AppRoute.loginScreen),
                            ),
                          ],
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
