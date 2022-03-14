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
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text("пн"),
                  Text("вт"),
                  Text("ср"),
                  Text("чт"),
                  Text("пт"),
                  Text("сб"),
                  Text("вс"),
                ],
              ),
              Expanded(
                child: ActivityCalendar(
                  activities: rl(),
                  toColor: Colors.green,
                  fromColor: Colors.grey.shade200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static final r = Random();

  static List<int> rl() => List.generate(500, (index) => r.nextInt(10));
}
