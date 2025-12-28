import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskassignment/common%20widgets/alaram_model.dart';
import 'package:taskassignment/common%20widgets/alert_tile.dart';
import 'package:taskassignment/helper/notification_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String name = 'Home-Page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<AlarmModel> _alarms = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Selected Location',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(26, 255, 255, 255),
                        Color.fromARGB(13, 255, 255, 255),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Add your location',
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(153, 255, 255, 255),
                        fontSize: 16,
                      ),

                      contentPadding: const EdgeInsets.symmetric(vertical: 0),

                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: const Color.fromARGB(153, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Alarms',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 15),
                Expanded(
                  child: _alarms.isEmpty
                      ? const Center(
                          child: Text(
                            'No alarms found',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _alarms.length,
                          itemBuilder: (context, index) {
                            final alarm = _alarms[index];

                            return AlarmTile(
                              time: DateFormat(
                                'hh:mm a',
                              ).format(alarm.dateTime),
                              date: DateFormat(
                                'EEE dd MMM yyyy',
                              ).format(alarm.dateTime),
                              isEnabled: alarm.isActive,
                              onChanged: (value) {
                                setState(() {
                                  _alarms[index] = AlarmModel(
                                    id: alarm.id,
                                    dateTime: alarm.dateTime,
                                    isActive: value,
                                  );
                                });
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),

        floatingActionButton: SizedBox(
          height: 56,
          width: 56,
          child: FloatingActionButton(
            onPressed: () {
              pickDateTime(context);
            },
            elevation: 0,
            backgroundColor: const Color(0xff5200FF),
            shape: const CircleBorder(),
            child: const Icon(Icons.add, color: Colors.white, size: 20),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }

  Future<void> pickDateTime(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // ⬅ prevent past alarms
      lastDate: DateTime(2100),
    );

    if (date == null) return;

    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time == null) return;

    final DateTime finalDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    if (finalDateTime.isBefore(DateTime.now())) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select a future time")),
        );
      }
      return;
    }

    final alarm = AlarmModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      dateTime: finalDateTime,
    );

    setState(() {
      _alarms.add(alarm);
    });

    await NotificationService.scheduleAlarm(
      id: alarm.id.hashCode,
      dateTime: alarm.dateTime,
    );
  }
}
