import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/authentication/presentation/widgets/auth_navigator_text.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController codeController = TextEditingController();
  String currentCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: '', isLeading: true,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Fruit Market', style: AppStyles.font42BoldPrimaryColor),
                SizedBox(height: 21),
                Text(
                  'Enter Received OTP',
                  style: AppStyles.font28BoldBlackColor,
                ),
                SizedBox(height: 30.h),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: codeController,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  enableActiveFill: true,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  cursorColor: AppColors.greyColor,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: 48.h,
                    fieldWidth: 48.w,
                    inactiveFillColor: AppColors.greyColor.withOpacity(0.1),
                    activeFillColor: AppColors.greyColor.withOpacity(0.1),
                    selectedFillColor: AppColors.greyColor.withOpacity(0.1),
                    inactiveColor: AppColors.greyColor,
                    activeColor: AppColors.greyColor,
                    selectedColor: AppColors.greyColor,
                    borderWidth: 1,
                  ),
                  textStyle: AppStyles.font14RegularBlackColor,
                  beforeTextPaste: (text) => false,
                  onChanged: (value) => setState(() => currentCode = value),
                  onCompleted: (value) => currentCode = value,
                  hintCharacter: '·',
                  hintStyle: AppStyles.font28BoldBlackColor.copyWith(
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(height: 52.h),
                CustomButtonWidget(title: 'Confirm', onPressed: () {
                  GoRouter.of(context).go(AppRoute.loginScreen);
                }),
                SizedBox(height: 40.h),
                Text('60', style: AppStyles.font28BoldBlackColor,),
                SizedBox(height: 34.h),
                AuthNavigatorText(text: 'Not received? ', textButton: 'Send Again', onTap: (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
