import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/core/widgets/custom_dropdown_widget.dart';
import 'package:fruits_app/core/widgets/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class CancelOrderDialog extends StatefulWidget {
  const CancelOrderDialog({super.key});

  @override
  State<CancelOrderDialog> createState() => _CancelOrderDialogState();
}

class _CancelOrderDialogState extends State<CancelOrderDialog> {
  final TextEditingController noteController = TextEditingController();
  String selectedReason = 'Select Reason';
  List<String> reasons = [
    'Select Reason',
    'Damaged product',
    'Wrong item delivered',
    'Late delivery',
    'Other',
  ];

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Cancel Order", style: AppStyles.font18BoldBlackColor),
            SizedBox(height: 20.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Reason", style: AppStyles.font14RegularGreyColor),
            ),
            SizedBox(height: 8.h),
            CustomDropdownWidget(
              selectedValue: selectedReason,
              items: reasons,
              onChanged: (value) {
                setState(() {
                  selectedReason = value!;
                });
              },
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
              maxline: 5,
              hintText: 'Enter your note',
              labelText: 'Note',
              controller: TextEditingController(),
              textInputType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your note';
                }
                return null;
              },
            ),
            SizedBox(height: 25.h),
            CustomButtonWidget(
              title: 'Confirm Cancelation',
              onPressed: () {
                context.pop();
                GoRouter.of(context).go(AppRoute.buttonNavigatorBar, extra: 1);
              },
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close", style: TextStyle(color: Colors.grey)),
            ),
          ],
        ),
      ),
    );
  }
}
