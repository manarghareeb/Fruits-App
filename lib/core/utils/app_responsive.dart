import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppResponsive {
  // Orientation
  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  // Device type
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= 600;

  // Screen dimensions
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Relative width based on screen
  static double rw(BuildContext context, double width) =>
      screenWidth(context) * width;

  // Relative height based on screen
  static double rh(BuildContext context, double height) =>
      screenHeight(context) * height;

  // Font size scale
  static double rf(BuildContext context, double fontSize) {
    // Use ScreenUtil if initialized, otherwise fallback to simple scaling
    try {
      return fontSize.sp;
    } catch (_) {
      // fallback scale
      double scaleFactor = screenWidth(context) / 430; // 430 = design width
      return fontSize * scaleFactor;
    }
  }

  // Example: safe padding for notch / status bar
  static double safeTop(BuildContext context) => MediaQuery.of(context).padding.top;
  static double safeBottom(BuildContext context) => MediaQuery.of(context).padding.bottom;
}
