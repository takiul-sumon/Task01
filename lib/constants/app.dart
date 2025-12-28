import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskassignment/constants/app_route.dart';
import 'package:taskassignment/features/splash_screen_one.dart';

class TravellReminderApp extends StatelessWidget {
  const TravellReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreenOne.name,
        onGenerateRoute: AppRouters.getRoute,
      ),
    );
  }
}
