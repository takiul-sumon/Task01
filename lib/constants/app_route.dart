import 'package:flutter/material.dart';
import 'package:taskassignment/features/fetch_location.dart';
import 'package:taskassignment/features/home_page.dart';
import 'package:taskassignment/features/splash_screen_one.dart';
import 'package:taskassignment/features/splash_screen_three.dart';
import 'package:taskassignment/features/splash_screen_two.dart';

class AppRouters {
  static Route<dynamic> getRoute(RouteSettings settings) {
    late final Widget screenWidget;

    if (settings.name == SplashScreenOne.name) {
      screenWidget = SplashScreenOne();
    } else if (settings.name == SplashScreenTwo.name) {
      screenWidget = SplashScreenTwo();
    } else if (settings.name == SplashScreenThree.name) {
      screenWidget = SplashScreenThree();
    } else if (settings.name == FetchLocation.name) {
      screenWidget = FetchLocation();
    } else if (settings.name == HomePage.name) {
      screenWidget = HomePage();
    }

    return MaterialPageRoute(
      builder: (context) {
        return screenWidget;
      },
    );
  }
}
