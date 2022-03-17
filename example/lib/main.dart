import 'dart:math';

import 'package:activity_calendar/activity_calendar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  static final DateFormat _weekdayFormat = DateFormat.E();
  static final List<DateTime> _weekdays = List.generate(
    7,
    (i) => DateTime(
      2000,
      0,
      6 + i,
    ),
  );

  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity Calendar Example',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Activity Calendar Example'),
            centerTitle: false,
            actions: [
              IconButton(
                icon: Icon(Icons.adaptive.more),
                // tooltip: MaterialLocalizations.of(context).showMenuTooltip,
                onPressed: () {
                  _selectColor(context: context);
                },
              ),
            ],
            bottom: PreferredSize(
              child: Row(
                children: _weekdays
                    .map((e) => Expanded(
                            child: Text(
                          _weekdayFormat.format(e),
                          textAlign: TextAlign.center,
                        )))
                    .toList(),
              ),
              preferredSize: const Size.fromHeight(16),
            ),
          ),
          body: ActivityCalendar(
            activities: rl(),
            fromColor: const Color(0xff202020),
            toColor: Colors.green.shade500,
            steps: 5,
            borderRadius: BorderRadius.circular(4),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.calendar_view_month),
                ),
                label: 'Вертикально',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_view_month),
                label: 'Горизонтально',
              ),
            ],
          ),
        ),
      ),
    );
  }

  static final r = Random();

  static List<int> rl([int length = 365]) =>
      List.generate(length, (index) => r.nextInt(10));
}

Future<Color?> _selectColor({
  required BuildContext context,
}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a color'),
        content: SizedBox(
          width: double.maxFinite,
          child: GridView.count(
            crossAxisCount: 5,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Colors.red,
              Colors.pink,
              Colors.purple,
              Colors.deepPurple,
              Colors.indigo,
              Colors.blue,
              Colors.lightBlue,
              Colors.cyan,
              Colors.teal,
              Colors.green,
              Colors.lightGreen,
              Colors.lime,
              Colors.yellowAccent,
              Colors.yellow,
              Colors.amber,
              Colors.orange,
              Colors.deepOrange,
              Colors.brown,
              Colors.grey,
              Colors.blueGrey,
              Colors.black,
              Colors.white,
            ]
                .map((color) => InkResponse(
                      onTap: () => Navigator.of(context).pop(color),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: color,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
