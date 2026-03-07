import 'package:flutter/material.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/theme/styles.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppStyles.font16RegularGreyColor(context).copyWith(color: AppColors.blackColor)
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            textButton,
            style: AppStyles.font16RegularBlueColorUnderline(context),
        ),
        ),
      ],
    );
  }
}
