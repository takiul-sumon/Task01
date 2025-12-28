import 'package:flutter/material.dart';
import 'package:taskassignment/common%20widgets/elevatedbutton.dart';
import 'package:taskassignment/features/home_page.dart';

class FetchLocation extends StatefulWidget {
  const FetchLocation({super.key});

  @override
  State<FetchLocation> createState() => _FetchLocationState();
  static const String name = 'fetch-location';
}

class _FetchLocationState extends State<FetchLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0B0024), Color(0xFF082257)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'Welcome! Your Smart\nTravel Alarm',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  height: 1.3, // line spacing
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Stay on schedule and enjoy every\n       moment of your journey.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  wordSpacing: 1.6,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 60),
              SizedBox(
                height: 215,
                width: 360,
                child: Image.asset(
                  'assets/images/dino-reichmuth-A5rCN8626Ck-unsplash 1.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 120),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent, // remove shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.white, width: 1.5),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Use Current Location',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomElevatedButton(onPressed: onTapNextPage, title: 'Home'),
            ],
          ),
        ),
      ),
    );
  }

  onTapNextPage() {
    Navigator.pushNamed(context, HomePage.name);
  }
}
