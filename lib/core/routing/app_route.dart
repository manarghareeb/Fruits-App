import 'package:fruits_app/features/authentication/presentation/views/forget_password_screen.dart';
import 'package:fruits_app/features/authentication/presentation/views/login_screen.dart';
import 'package:fruits_app/features/authentication/presentation/views/signup_screen.dart';
import 'package:fruits_app/features/authentication/presentation/views/verification_screen.dart';
import 'package:fruits_app/features/authentication/presentation/views/welcome_screen.dart';
import 'package:fruits_app/features/checkout/presentation/views/checkout_screen.dart';
import 'package:fruits_app/features/checkout/presentation/views/order_case_screen.dart';
import 'package:fruits_app/features/home/presentation/views/button_navigator_bar.dart';
import 'package:fruits_app/features/home/presentation/views/product_details_screen.dart';
import 'package:fruits_app/features/home/presentation/views/seller_details_screen.dart';
import 'package:fruits_app/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:fruits_app/features/order/presentation/views/order_tracking_screen.dart';
import 'package:fruits_app/features/settings/presentation/views/about_us_screen.dart';
import 'package:fruits_app/features/settings/presentation/views/profile_screen.dart';
import 'package:fruits_app/features/settings/presentation/views/support_screen.dart';
import 'package:fruits_app/features/settings/presentation/views/terms_and_conditions_screen.dart';
import 'package:fruits_app/features/splash/presentation/views/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static final String splashScreen = '/splashScreen';
  static final String onBoardingScreen = '/onBoardingScreen';
  static final String loginScreen = '/loginScreen';
  static final String signupScreen = '/signupScreen';
  static final String verificationScreen = '/verificationScreen';
  static final String forgetPasswordScreen = '/forgetPasswordScreen';
  static final String welcomeScreen = '/welcomeScreen';
  static final String buttonNavigatorBar = '/buttonNavigatorBar';
  static const String homeScreen = '/homeScreen';
  static const String orderScreen = '/orderScreen';
  static const String settingsScreen = '/settingsScreen';
  static const String profileScreen = '/profileScreen';
  static const String favoriteScreen = '/favoriteScreen';
  static const String basketScreen = '/basketScreen';
  static const String sellerDetailsScreen = '/sellerDetailsScreen';
  static const String productDetailsScreen = '/productDetailsScreen';
  static const String supportScreen = '/supportScreen';
  static const String termsAndConditionsScreen = '/termsAndConditionsScreen';
  static const String aboutUsScreen = '/aboutUsScreen';
  static const String orderTrackingScreen = '/orderTrackingScreen';
  static const String checkoutScreen = '/checkoutScreen';
  static const String orderCaseScreen = '/orderCaseScreen';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: buttonNavigatorBar,
        builder: (context, state) {
          final int index = state.extra as int? ?? 0;
          return ButtonNavigatorBar(initialIndex: index);
        },
      ),
      GoRoute(
        path: welcomeScreen,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: onBoardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: signupScreen,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: verificationScreen,
        builder: (context, state) => const VerificationScreen(),
      ),
      GoRoute(
        path: forgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: sellerDetailsScreen,
        builder: (context, state) => const SellerDetailsScreen(),
      ),
      GoRoute(
        path: productDetailsScreen,
        builder: (context, state) => const ProductDetailsScreen(),
      ),
      GoRoute(
        path: profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: supportScreen,
        builder: (context, state) => const SupportScreen(),
      ),
      GoRoute(
        path: termsAndConditionsScreen,
        builder: (context, state) => const TermsAndConditionsScreen(),
      ),
      GoRoute(
        path: aboutUsScreen,
        builder: (context, state) => const AboutUsScreen(),
      ),
      GoRoute(
        path: orderTrackingScreen,
        builder: (context, state) => const OrderTrackingScreen(),
      ),
      GoRoute(
        path: checkoutScreen,
        builder: (context, state) => const CheckoutScreen(),
      ),
      GoRoute(
        path: orderCaseScreen,
        builder: (context, state) {
          final bool isError = state.extra as bool? ?? false;
          return OrderCaseScreen(isError: isError);
        },
      ),
    ],
  );
}
