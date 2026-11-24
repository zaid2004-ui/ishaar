import 'package:flutter/material.dart';
import 'package:ishaar/core/routes/app_pages.dart';
import 'package:ishaar/features/login/view/login_sereen.dart';
import 'package:ishaar/features/onboarding/view/onboarding_screen.dart';
import 'package:ishaar/features/splash/view/splash_screen.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppPages.splashScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );
      case AppPages.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) {
            return OnBoardingScreen();
          },
        );
      case AppPages.loginSereen:
        return MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        );

      default:
        return null;
    }
  }

  static Future<dynamic> pushNamed(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  static Future<dynamic> pushNamedAndRemoveUntil(
    String routeName,
    String untilRoute, {
    dynamic args,
  }) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      ModalRoute.withName(untilRoute),
      arguments: args,
    );
  }

  static void back() {
    navigatorKey.currentState!.pop();
  }

  static void backToRoot() {
    navigatorKey.currentState!.popUntil(
      (Route<dynamic> route) => route.isFirst,
    );
  }

  static Future<dynamic> startNewRoute(String routeName, {dynamic args}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: args,
    );
  }
}
