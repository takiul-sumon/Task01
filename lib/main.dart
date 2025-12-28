import 'package:flutter/material.dart';
import 'package:taskassignment/constants/app.dart';
import 'package:taskassignment/helper/notification_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  runApp(const TravellReminderApp());
}
