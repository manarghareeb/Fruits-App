import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/core/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/order/presentation/widgets/order_status_card.dart';
import 'package:go_router/go_router.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    final List<String> statuses = [
      'Delivering',
      'Finished',
      'Canceled',
      'Working',
      'New',
      'Other',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'My Orders'),
      body: isLandscape
          ? GridView.builder(
              itemCount: statuses.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //crossAxisSpacing: 2.w,
                //mainAxisSpacing: 8.h,
                childAspectRatio: 4.3.h, 
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoute.orderTrackingScreen);
                    },
                    child: OrderStatusCard(
                      orderId: "24318${index + 8}",
                      price: "37",
                      date: "9 Sep",
                      itemCount: "4",
                      status: statuses[index],
                    ),
                  ),
                );
              },
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
              itemCount: statuses.length,
              separatorBuilder: (context, index) => SizedBox(height: 4.h),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRoute.orderTrackingScreen);
                    },
                    child: OrderStatusCard(
                      orderId: "24318${index + 8}",
                      price: "37",
                      date: "9 Sep",
                      itemCount: "4",
                      status: statuses[index],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
