import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/add_address_dialog.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/selected_checked_row.dart';
import 'package:go_router/go_router.dart';

class DeliveryAddressStep extends StatefulWidget {
  const DeliveryAddressStep({super.key});

  @override
  State<DeliveryAddressStep> createState() => _DeliveryAddressStepState();
}

class _DeliveryAddressStepState extends State<DeliveryAddressStep> {
  int selectedAddressIndex = -1;
  List<Map<String, String>> addresses = [
    {
      'name': 'John Doe',
      'phone': '+000-11-1234567',
      'details':
          'Room # 1 - Ground Floor, Al Najoum Building, 24 B Street, Dubai',
    },
  ];

  void addNewAddress() {
    GoRouter.of(context).pop();
    setState(() {
      addresses.add({
        'name': 'New User',
        'phone': '+000-11-0000000',
        'details': 'New Address Details',
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Select Delivery Address', style: AppStyles.font18BoldBlackColor),
        SizedBox(height: 15.h),
        SelectedCheckedRow(
          title: 'Add New Address',
          isAddress: true,
          onTap: () => showDialog(
            context: context,
            builder: (context) => AddAddressDialog(onTapAdd: addNewAddress),
          ),
        ),
        SizedBox(height: 15.h),

        ...List.generate(addresses.length, (index) {
          final addr = addresses[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: SelectedCheckedRow(
              title: 'Address ${index + 1}',
              showIcon: true,
              isSelected: selectedAddressIndex == index,
              onTap: () => setState(() => selectedAddressIndex = index),
              child: selectedAddressIndex == index
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 9.h),
                        Text(
                          addr['name']!,
                          style: AppStyles.font16RegularDarkGreyColor,
                        ),
                        Text(
                          addr['phone']!,
                          style: AppStyles.font16RegularDarkGreyColor,
                        ),
                        SizedBox(height: 9.h),
                        Text(
                          addr['details']!,
                          style: AppStyles.font16RegularDarkGreyColor.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  : null,
            ),
          );
        }),
      ],
    );
  }
}
