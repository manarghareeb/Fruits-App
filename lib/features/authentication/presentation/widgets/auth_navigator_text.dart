import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class AuthNavigatorText extends StatelessWidget {
  const AuthNavigatorText({
    super.key,
    required this.text,
    required this.textButton,
    required this.onTap,
  });

  final String text;
  final String textButton;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: isLandscape ? AppStyles.font18RegularBlackColor.copyWith(
          fontSize: 10.sp
        ) : AppStyles.font18RegularBlackColor.copyWith(
          fontSize: 16.sp
        )),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textButton,
            style: AppStyles.font18RegularBlueColorUnderline.copyWith(
          fontSize: isLandscape ? 10.sp : 16.sp
        )),
        ),
      ],
    );
  }
}
