import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key, this.title, this.actions, this.centerTitle, this.isLeading = false,
  });
  final String? title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final bool? isLeading;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Text(
        title ?? 'Fruit Market',
        style: AppStyles.font24BoldPrinaryColor,
      ),
      centerTitle: centerTitle ?? true,
      actions: actions,
      leading: isLeading == true
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 25.sp,),
              onPressed: () => Navigator.pop(context),
            )
          : null,
    );
  }
}
