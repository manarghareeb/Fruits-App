import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({
    super.key,
    required this.controller,
    required this.onChanged,
  });
  final TextEditingController controller;
  final Function(PhoneNumber) onChanged;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'Phone Number',
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
          child: IntlPhoneField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Mobile Number',
              counterText: '',
              errorStyle: TextStyle(fontSize: 12.sp),
              hintStyle: AppStyles.font14RegularBlackColor(context),
              contentPadding: EdgeInsets.symmetric(
                vertical: 14.h,
                horizontal: 16.w,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.r),
                borderSide: BorderSide.none,
              ),
            ),
            initialCountryCode: 'EG',
            dropdownIconPosition: IconPosition.leading,
            dropdownTextStyle: AppStyles.font14RegularBlackColor(context),
            keyboardType: TextInputType.phone,
            style: AppStyles.font14RegularBlackColor(context),
            pickerDialogStyle: PickerDialogStyle(
              backgroundColor: Colors.white,
              countryCodeStyle: AppStyles.font14RegularBlackColor(context),
              countryNameStyle: AppStyles.font14RegularBlackColor(context),
            ),
            dropdownIcon: Icon(
              Icons.keyboard_arrow_down,
              color: AppColors.greyColor,
              size: isLandscape ? 20.sp : 30.sp,
            ),
            flagsButtonPadding: EdgeInsets.only(left: 8.w),
            disableLengthCheck: false,
            onChanged: onChanged,
            /*validator: (phone) {
              if (controller.text.trim().isEmpty) {
                return 'Please enter your phone number';
              }
              try {
                if (phone == null) {
                  return 'Please enter a valid phone number';
                }
                final isValid = phone.isValidNumber();
                if (!isValid) {
                  return 'Please enter a valid phone number';
                }
              } catch (_) {
                return 'Please enter a valid phone number';
              }
              return null;
            },*/
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ),
      ],
    );
  }
}
