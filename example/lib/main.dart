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
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
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
                  fromColor: Colors.white,
                  toColor: Colors.black,
                  weekday: DateTime.friday,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static final r = Random();

  static List<int> rl() => List.generate(90, (index) => r.nextInt(10));
}
