import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/widgets/custom_button_widget.dart';
import 'package:fruits_app/features/checkout/presentation/views/delivery_address_step.dart';
import 'package:fruits_app/features/checkout/presentation/views/delivery_time_step.dart';
import 'package:fruits_app/features/checkout/presentation/views/payment_step.dart';
import 'package:fruits_app/features/checkout/presentation/widgets/step_indicator_widget.dart';
import 'package:go_router/go_router.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Checkout', isLeading: true),
      body: isLandscape
          ? Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 10.w,
                  ),
                  child: Column(
                    children: [
                      StepIndicatorWidget(currentStep: currentStep),
                      const Spacer(),
                      buildActionButton(
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(20.w),
                    child: buildCurrentStepContent(),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 20.w,
                  ),
                  child: StepIndicatorWidget(currentStep: currentStep),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: buildCurrentStepContent(),
                  ),
                ),
                buildActionButton(EdgeInsets.all(20.w)),
              ],
            ),
    );
  }

  Padding buildActionButton(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: CustomButtonWidget(
        title: currentStep == 2 ? 'Place Order' : 'Continue',
        onPressed: () {
          if (currentStep < 2) {
            setState(() => currentStep++);
          } else {
            GoRouter.of(context).push(AppRoute.orderCaseScreen, extra: false);
          }
        },
      ),
    );
  }

  Widget buildCurrentStepContent() {
    switch (currentStep) {
      case 0:
        return const DeliveryTimeStep();
      case 1:
        return const DeliveryAddressStep();
      case 2:
        return const PaymentStep();
      default:
        return const SizedBox();
    }
  }
}
