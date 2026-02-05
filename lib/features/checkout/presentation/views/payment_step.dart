import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/order_details.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/selected_checked_row.dart';

class PaymentStep extends StatefulWidget {
  const PaymentStep({super.key});

  @override
  State<PaymentStep> createState() => _PaymentStepState();
}

class _PaymentStepState extends State<PaymentStep> {
  int selectedPayment = 0;
  final List<Map<String, String>> orderDetails = [
    {'title': 'Total items', 'value': '36.00 KD'},
    {'title': 'Subtotal', 'value': '36.00 KD'},
    {'title': 'Shipping Charges', 'value': '1.50 KD'},
    {'title': 'Bag Total', 'value': '37.50 KD'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Copun Code', style: AppStyles.font18BoldBlackColor),
        SizedBox(height: 15.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Do You Have any Coupon Code?',
                style: AppStyles.font16RegularDarkGreyColor,
              ),
              CustomButtonWidget(
                height: 48.h,
                width: 85.w,
                title: 'Apply',
                onPressed: () {},
                textStyle: AppStyles.font12SemiBoldWhiteColor.copyWith(
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.h),
        Text('Order Details', style: AppStyles.font18BoldBlackColor),
        SizedBox(height: 15.h),
        OrderDetails(orderDetails: orderDetails, isOrder: true,),
        SizedBox(height: 22.h,),
        Text('Payment', style: AppStyles.font18BoldBlackColor),
        SizedBox(height: 15.h),
        SelectedCheckedRow(
          title: 'Credit Card/Debit card',
          isSelected: selectedPayment == 0,
          onTap: () => setState(() => selectedPayment = 0),
          iconWidget: SvgPicture.asset(
            AppImages.creditCart,
            width: 20.w,
            height: 20.h,
          ),
        ),
        SizedBox(height: 15.h),
        SelectedCheckedRow(
          title: 'Cash on Delivery',
          isSelected: selectedPayment == 1,
          onTap: () => setState(() => selectedPayment = 1),
          iconWidget: SvgPicture.asset(
            AppImages.cash,
            width: 20.w,
            height: 20.h,
          ),
        ),
        SizedBox(height: 15.h),
        SelectedCheckedRow(
          title: 'Knet',
          isSelected: selectedPayment == 2,
          onTap: () => setState(() => selectedPayment = 2),
          iconWidget: SvgPicture.asset(
            AppImages.knet,
            width: 20.w,
            height: 20.h,
          ),
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}

