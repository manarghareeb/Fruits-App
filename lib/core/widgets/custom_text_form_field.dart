import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.validator,
    required this.hintText,
    required this.textInputType,
    this.maxline,
  });
  final String labelText;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final TextInputType textInputType;
  final int? maxline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: labelText,
            style: AppStyles.font14RegularGreyColor(context),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(height: 13.5.h),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: TextFormField(
            maxLines: maxline,
            controller: controller,
            style: AppStyles.font14RegularGreyColor(context),
            validator: validator,
            keyboardType: textInputType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppStyles.font14RegularBlackColor(context),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 18.w,
                vertical: 10.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
