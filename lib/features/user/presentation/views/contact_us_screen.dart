import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_cubit.dart';
import 'package:fruits_app/features/user/presentation/cubit/user_cubit/user_state.dart';
import 'package:fruits_app/features/user/presentation/widgets/custom_phone_field.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String completePhoneNumber = "";

  final List contact = [
    AppImages.whatsapp,
    AppImages.facebook,
    AppImages.instgram,
    AppImages.youtube,
  ];

  @override
  void dispose() {
    nameController.dispose();
    messageController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Contact Us', isLeading: true),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is UserSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.userEntity.message ?? 'Sent Successfully'),
                backgroundColor: Colors.green,
              ),
            );
            nameController.clear();
            phoneController.clear();
            messageController.clear();
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
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
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
                      maxline: 5,
                      hintText: 'Enter your message',
                      labelText: 'Message',
                      controller: messageController,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your message';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 21.h),
                    state is UserLoading
                        ? const CircularProgressIndicator()
                        : CustomButtonWidget(
                            title: 'Submit',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<UserCubit>().contactUs(
                                  name: nameController.text,
                                  mobile: completePhoneNumber,
                                  message: messageController.text,
                                );
                              }
                            },
                          ),
                    SizedBox(height: 27.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: contact
                          .map(
                            (path) => Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 8.h,
                              ),
                              child: Container(
                                width: isLandscape ? 30.w : 48.w,
                                height: isLandscape ? 30.w : 48.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  shape: BoxShape.circle,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 11.w,
                                  vertical: 11.h,
                                ),
                                child: SvgPicture.asset(
                                  path,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
