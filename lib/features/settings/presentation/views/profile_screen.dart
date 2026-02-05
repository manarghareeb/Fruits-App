import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/authentication/presentation/widgets/custom_phone_field.dart';
import 'package:fruits_app/features/settings/presentation/widgets/image_photo.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
      appBar: const CustomAppBar(
        isLeading: true,
        title: 'Profile',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 48.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  const ImagePhoto(),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Icon(FontAwesomeIcons.camera)
                  ),
                ],
              ),
              SizedBox(height: 18.h,),
              Text('Welcome, Ahmed', style: AppStyles.font24RegularBlackColor),
              SizedBox(height: 38.h,),
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
                SizedBox(height: 14.h),
                const CustomPhoneField(),
                SizedBox(height: 14.h),
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
                SizedBox(height: 40.h,),
                CustomButtonWidget(title: 'Update', onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
