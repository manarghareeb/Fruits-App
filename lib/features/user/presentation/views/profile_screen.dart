import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_state.dart';
import 'package:fruits_app/features/user/presentation/widgets/custom_phone_field.dart';
import 'package:fruits_app/features/user/presentation/widgets/image_photo.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  File? selectedImage;
  String completePhoneNumber = "";

  @override
  void initState() {
    super.initState();
    final authCubit = context.read<UserCubit>();
    if (authCubit.state is UserSuccess) {
      final user = (authCubit.state as UserSuccess).userEntity;
      nameController = TextEditingController(text: user.name);
      String rawPhone = user.mobile;
      if (rawPhone.startsWith('+20')) {
        rawPhone = rawPhone.replaceFirst('+20', '');
      }
      phoneController = TextEditingController(text: rawPhone);
      emailController = TextEditingController(text: user.email);
      completePhoneNumber = user.mobile;
    } else {
      nameController = TextEditingController();
      phoneController = TextEditingController();
      emailController = TextEditingController();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(isLeading: true, title: 'Profile'),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Profile Updated Successfully'),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state is UserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is UserSuccess) {
            final user = state.userEntity;
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 48.h),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: Stack(
                          children: [
                            ImagePhoto(
                              localImage: selectedImage,
                              imageUrl: user.profilePhotoPath,
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 18.r,
                                child: Icon(
                                  FontAwesomeIcons.camera,
                                  size: isLandscape ? 15.sp : 20.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18.h),
                      Text(
                        'Welcome, ${user.name}',
                        style: AppStyles.font24RegularBlackColor(context),
                      ),
                      SizedBox(height: 38.h),
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
                      CustomPhoneField(
                        controller: phoneController,
                        onChanged: (phone) {
                          completePhoneNumber = phone.completeNumber;
                        },
                      ),
                      SizedBox(height: 14.h),
                      CustomTextFormField(
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40.h),
                      if (state is UserLoading)
                        const CircularProgressIndicator()
                      else
                        CustomButtonWidget(
                          title: 'Update',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<UserCubit>().updateProfile(
                                userId: user.id!,
                                name: nameController.text,
                                email: emailController.text,
                                mobile: completePhoneNumber,
                                imagePath: selectedImage?.path,
                              );
                            }
                          },
                        ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is UserLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(
              child: Text("Please login to see your profile"),
            );
          }
        },
      ),
    );
  }
}
