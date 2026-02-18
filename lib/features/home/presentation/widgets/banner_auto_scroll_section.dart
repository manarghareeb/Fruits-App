import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruits_app/core/theme/images.dart';
import 'package:fruits_app/core/widgets/custom_smooth_page_indicator.dart';

class BannerAutoScrollSection extends StatefulWidget {
  final double height;

  const BannerAutoScrollSection({super.key, this.height = 200});

  @override
  State<BannerAutoScrollSection> createState() => _BannerAutoScrollSectionState();
}

class _BannerAutoScrollSectionState extends State<BannerAutoScrollSection> {
  late PageController controller;
  int index = 0;
  Timer? timer;

  final List<String> banners = [
    AppImages.banner,
    AppImages.productBanner,
    AppImages.banner,
    AppImages.productBanner,
  ];

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1, viewportFraction: 0.68);

    timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!controller.hasClients) return;
      controller.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height.h,
          child: PageView.builder(
            controller: controller,
            itemCount: banners.length + 2,
            onPageChanged: (i) {
              int newIndex;
              if (i == 0) {
                newIndex = banners.length - 1;
                Future.delayed(const Duration(milliseconds: 300), () {
                  controller.jumpToPage(banners.length);
                });
              } else if (i == banners.length + 1) {
                newIndex = 0;
                Future.delayed(const Duration(milliseconds: 300), () {
                  controller.jumpToPage(1);
                });
              } else {
                newIndex = i - 1;
              }
              setState(() => index = newIndex);
            },
            itemBuilder: (context, i) {
              int displayIndex;
              if (i == 0) {
                displayIndex = banners.length - 1;
              } else if (i == banners.length + 1) {
                displayIndex = 0;
              } else {
                displayIndex = i - 1;
              }
        
              int difference = (i - (index + 1)).abs();
              double scale = (1 - difference * 0.15).clamp(0.8, 1.0);
              double opacity = (1 - difference * 0.3).clamp(0.6, 1.0);
        
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Transform.scale(
                  scale: scale,
                  child: Opacity(
                    opacity: opacity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.asset(
                          banners[displayIndex],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 16.h),
        CustomSmoothPageIndicator(
          controller: controller,
          count: banners.length,
        ),
      ],
    );
  }
}
