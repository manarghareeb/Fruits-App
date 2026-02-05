import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DottedDivider extends StatelessWidget {
  final double height;
  final double dashWidth;
  final double dashSpace;
  final Color color;

  const DottedDivider({
    super.key,
    this.height = 1,
    this.dashWidth = 5,
    this.dashSpace = 3,
    this.color = Colors.grey,
  });

  /*@override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 30.w;
    final dashCount = (width / (dashWidth + dashSpace)).floor();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(dashCount, (_) {
        return Container(
          width: dashWidth.w,
          height: height,
          color: color,
        );
      }),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashCount = (boxWidth / (dashWidth + dashSpace)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return Container(
              width: dashWidth.w,
              height: height,
              color: color,
            );
          }),
        );
      },
    );
  }
}
