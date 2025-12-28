import 'package:flutter/material.dart';

class CustomDot extends StatelessWidget {
  const CustomDot({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 9),
      height: 9,
      width: 9, // same height & width = circle
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? Colors.deepPurpleAccent
            : Colors.white.withOpacity(0.3),
      ),
    );
  }
}
