import 'package:flutter/material.dart';
import 'package:taskassignment/common%20widgets/custom_dot.dart';
import 'package:taskassignment/common%20widgets/elevatedbutton.dart';
import 'package:taskassignment/features/splash_screen_two.dart';

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({super.key});
  static const String name = 'splash-screen1';

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
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
                      'assets/images/morninggif1 1.png',
                      height: 460,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 32),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Discover the world, one\njourney at a time.',
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
                      'From hidden gems to iconic destinations, we make travel simple, inspiring, and unforgettable. Start your next adventure today',
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
                      CustomDot(isActive: true),
                      CustomDot(isActive: false), // active dot
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
                  // Navigator.pushReplacement(...)
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
    Navigator.pushNamed(context, SplashScreenTwo.name);
  }
}
