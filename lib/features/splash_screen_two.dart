import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskassignment/common%20widgets/custom_dot.dart';
import 'package:taskassignment/common%20widgets/elevatedbutton.dart';
import 'package:taskassignment/features/fetch_location.dart';
import 'package:taskassignment/features/splash_screen_three.dart';

class SplashScreenTwo extends StatefulWidget {
  const SplashScreenTwo({super.key});
  static const String name = 'splash-screeb02';

  @override
  State<SplashScreenTwo> createState() => _SplashScreenTwoState();
}

class _SplashScreenTwoState extends State<SplashScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff082257), Color(0xff0B0024)],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                    child: Image.asset(
                      'assets/images/morning walk gif 1.png',
                      height: 430.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 32),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Explore new horizons, one step at a time',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Every trip holds a story waiting to be lived. Let us \nguide you to experiences that inspire, connect, and\nlast a lifetime',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomDot(isActive: false),
                      CustomDot(isActive: true), // active dot
                      CustomDot(isActive: false),
                    ],
                  ),
                  const SizedBox(height: 32),

                  CustomElevatedButton(title: 'Next', onPressed: onTapNextPage),
                ],
              ),
            ),

            Positioned(
              top: 50,
              right: 24,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, FetchLocation.name);
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onTapNextPage() {
    Navigator.pushNamed(context, SplashScreenThree.name);
  }
}
