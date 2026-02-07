import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({
    super.key,
    required this.orderDetails,
    this.isOrder = false,
  });

  final List<Map<String, String>> orderDetails;
  final bool isOrder;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...orderDetails.asMap().entries.map((entry) {
          final item = entry.value;
          final isBagTotal = item['title'] == 'Bag Total';
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item['title'] ?? '',
                      style: isBagTotal
                          ? AppStyles.font16BoldPrimaryColor(context)
                          : AppStyles.font16RegularDarkGreyColor(context),
                    ),
                    Text(
                      item['value'] ?? '',
                      style: isBagTotal
                          ? AppStyles.font16BoldPrimaryColor(context)
                          : AppStyles.font16RegularDarkGreyColor(context),
                    ),
                  ],
                ),
              ),
              if (item['title'] == 'Shipping Charges' && isOrder == true)
                Divider(thickness: 1, color: Colors.grey.shade300),
            ],
          );
        }),
      ],
    );
  }
}
