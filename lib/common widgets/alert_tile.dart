import 'package:flutter/material.dart';

class AlarmTile extends StatelessWidget {
  final String time;
  final String date;
  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  const AlarmTile({
    super.key,
    required this.time,
    required this.date,
    required this.isEnabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(31, 255, 255, 255), // 12%
            Color.fromARGB(15, 255, 255, 255),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          // Time
          Text(
            time,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),

          const Spacer(),

          // Date
          Text(date, style: TextStyle(color: Colors.white, fontSize: 14)),

          const SizedBox(width: 12),

          // Switch
          Switch(
            value: isEnabled,
            onChanged: onChanged,
            activeTrackColor: const Color(0xFF7B4DFF),
            inactiveThumbColor: Colors.black,
            inactiveTrackColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
