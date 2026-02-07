import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({super.key});

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
            decoration: InputDecoration(
              hintText: 'Mobile Number',
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
            disableLengthCheck: true,
            onChanged: (phone) {},
          ),
        ),
      ],
    );
  }
}
