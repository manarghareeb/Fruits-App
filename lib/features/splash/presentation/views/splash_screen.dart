import 'package:flutter/material.dart';
import 'package:fruits_app/core/routing/app_route.dart';
import 'package:fruits_app/core/utils/app_responsive.dart';
import 'package:fruits_app/features/splash/presentation/widgets/splash_screen_landscape.dart';
import 'package:fruits_app/features/splash/presentation/widgets/splash_screen_portrait.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            GoRouter.of(context).go(AppRoute.onBoardingScreen);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = AppResponsive.isLandscape(context);

    return Scaffold(
      backgroundColor: const Color(0xFF003602),
      body: SafeArea(
        child: Center(
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return isLandscape
              ? SplashScreenLandscape(
                  fadeAnimation: fadeAnimation,
                  slideAnimation: slideAnimation,
                )
              : SplashScreenPortrait(
                  fadeAnimation: fadeAnimation,
                  slideAnimation: slideAnimation,
                );
            },
          ),
        ),
      ),
    );
  }
}
