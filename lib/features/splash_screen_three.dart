import 'package:flutter/material.dart';
import 'package:taskassignment/common%20widgets/custom_dot.dart';
import 'package:taskassignment/common%20widgets/elevatedbutton.dart';
import 'package:taskassignment/features/fetch_location.dart';

class SplashScreenThree extends StatefulWidget {
  const SplashScreenThree({super.key});
  static const String name = 'splashs-screen03';

  @override
  State<SplashScreenThree> createState() => _SplashScreenThreeState();
}

class _SplashScreenThreeState extends State<SplashScreenThree> {
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
                      'assets/images/b2477c8c241e9b0db4a917dc85f3cc72 1.png',
                      height: 460,
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
                      'Travel made simple and exciting—discover places you’ll love and moments you’ll never forget.',
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
                      CustomDot(isActive: false), // active dot
                      CustomDot(isActive: true),
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
    Navigator.of(context).pushNamed(FetchLocation.name);
  }
}
