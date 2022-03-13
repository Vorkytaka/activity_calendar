import 'dart:math';

import 'package:activity_calendar/activity_calendar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity Calendar Example',
      home: Scaffold(
        body: ActivityCalendar(
          activities: rl(),
          toColor: Colors.blue,
          fromColor: Colors.transparent,
        ),
      ),
    );
  }

  static final r = Random();

  static List<int> rl() => List.generate(50, (index) => r.nextInt(10));
}
