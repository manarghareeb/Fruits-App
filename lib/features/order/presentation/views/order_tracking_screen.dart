import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/order/presentation/widgets/cancel_order_dialog.dart';
import 'package:fruits_app/features/order/presentation/widgets/time_line_step.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final TextEditingController noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Order Tracking', isLeading: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 21.h),
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: 'Your Order Code: ',
                style: AppStyles.font18RegularDarkGreyColor,
                children: [
                  TextSpan(
                    text: '#882610',
                    style: AppStyles.font18RegularDarkGreyColor.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "3 items - 37.50 KD",
              style: AppStyles.font18RegularDarkGreyColor,
            ),
            Text(
              "Payment Method : Cash",
              style: AppStyles.font18RegularDarkGreyColor,
            ),
            SizedBox(height: 30.h),
            TimelineStep(
              title: 'Delivered',
              subtitle: 'Estimated for 10 September, 2021',
              isCompleted: false,
              isLast: false,
            ),
            TimelineStep(
              title: 'Out for delivery',
              subtitle: 'Estimated for 10 September, 2021',
              isCompleted: false,
              isLast: false,
            ),
            TimelineStep(
              title: "Order shipped",
              subtitle: "Estimated for 10 September, 2021",
              isCompleted: true,
              isLast: false,
            ),
            TimelineStep(
              title: "Confirmed",
              subtitle: "Your order has been confirmed",
              isCompleted: true,
              isLast: false,
            ),
            TimelineStep(
              title: "Order Placed",
              subtitle: "We have received your order",
              isCompleted: true,
              isLast: true,
            ),
            SizedBox(height: 50.h),
            CustomButtonWidget(title: 'Confirm', onPressed: () {}),
            SizedBox(height: 15.h),
            CustomButtonWidget(
              title: 'Cancel Order',
              onPressed: () => showDialog(
                context: context,
                builder: (context) => CancelOrderDialog(),
              ),
              backgroundColor: AppColors.redColor,
              bordercolor: AppColors.redColor,
            ),
          ],
        ),
      ),
    );
  }
}
