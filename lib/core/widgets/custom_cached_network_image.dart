import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/api/end_ponits.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit,
  });
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: '${EndPoint.baseUrl}uploads/$imagePath',
      fit: fit ?? BoxFit.cover,

      placeholder: (context, url) {
        log('Loading image: $url');
        return Container(width: width, height: height, color: Colors.grey[200]);
      },

      errorWidget: (context, url, error) {
        log('Error loading image: $url, error: $error');
        return const Icon(Icons.image_not_supported);
      },
  
    );
  }
}