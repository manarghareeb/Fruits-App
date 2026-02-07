import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/authentication/presentation/widgets/custom_phone_field.dart';

class AddAddressDialog extends StatefulWidget {
  const AddAddressDialog({super.key, required this.onTapAdd});
  final VoidCallback onTapAdd;

  @override
  State<AddAddressDialog> createState() => _AddAddressDialogState();
}

class _AddAddressDialogState extends State<AddAddressDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Add Address", style: AppStyles.font18BoldBlackColor(context)),
            SizedBox(height: 20.h),
            CustomTextFormField(
              hintText: 'Enter your name',
              labelText: 'Note',
              controller: nameController,
              textInputType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 15.h),
            const CustomPhoneField(),
            SizedBox(height: 15.h),
            CustomTextFormField(
              maxline: 5,
              hintText: 'Enter your address',
              labelText: 'Note',
              controller: addressController,
              textInputType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            SizedBox(height: 25.h),
            CustomButtonWidget(
              title: 'Add Address',
              onPressed: widget.onTapAdd,
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: AppStyles.font16RegularDarkGreyColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
