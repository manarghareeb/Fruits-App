/*import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class ImagePhoto extends StatelessWidget {
  const ImagePhoto({super.key, this.imageUrl, this.localImage});
  final String? imageUrl;
  final File? localImage;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);
    final bool isValidUrl = imageUrl != null && imageUrl!.startsWith('http');

    return Container(
      width: isLandscape ? 45.w : 100.w,
      height: isLandscape ? 45.w : 100.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.lightBlackColor),
      ),
      child: ClipOval(
        child: localImage != null
            ? Image.file(localImage!, fit: BoxFit.cover)
            : isValidUrl
            ? Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  FontAwesomeIcons.user,
                  color: AppColors.lightBlackColor,
                  size: isLandscape ? 20.sp : 40.sp,
                ),
              )
            : Icon(
                FontAwesomeIcons.user,
                color: AppColors.lightBlackColor,
                size: isLandscape ? 20.sp : 40.sp,
              ),
      ),
    );
  }
}*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_app/core/theme/colors.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';

class ImagePhoto extends StatelessWidget {
  const ImagePhoto({super.key, this.imageUrl, this.localImage});
  final String? imageUrl;
  final File? localImage;

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);

    final bool hasValidUrl =
        imageUrl != null &&
        imageUrl!.trim().isNotEmpty &&
        imageUrl!.startsWith('http') &&
        Uri.tryParse(imageUrl!) != null;

    return Container(
      width: isLandscape ? 45.w : 100.w,
      height: isLandscape ? 45.w : 100.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.lightBlackColor.withOpacity(0.2)),
        color: Colors.grey[100], 
      ),
      child: ClipOval(child: _buildImageChild(isLandscape, hasValidUrl)),
    );
  }

  Widget _buildImageChild(bool isLandscape, bool hasValidUrl) {
    if (localImage != null) {
      return Image.file(localImage!, fit: BoxFit.cover);
    }

    if (hasValidUrl && !imageUrl!.contains("vectorstock_42790750.png")) {
      return Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            _buildPlaceholder(isLandscape),
      );
    }

    return _buildPlaceholder(isLandscape);
  }

  Widget _buildPlaceholder(bool isLandscape) {
    return Center(
      child: Icon(
        FontAwesomeIcons.user,
        color: AppColors.lightBlackColor.withOpacity(0.5),
        size: isLandscape ? 20.sp : 40.sp,
      ),
    );
  }
}
