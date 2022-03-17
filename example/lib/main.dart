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

  static final Object _fromColorKey = Object();
  static final Object _toColorKey = Object();

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
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text(
                            'Settings',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        const Divider(
                          height: 1,
                          indent: 8,
                          endIndent: 8,
                        ),
                        ListTile(
                          title: const Text('Color from'),
                          onTap: () async {
                            final color = await _selectColor(context: context);
                            if (color != null) {
                              SharedAppData.setValue(
                                context,
                                _fromColorKey,
                                color,
                              );
                            }
                          },
                          trailing: _ColorWidget(
                            color: SharedAppData.getValue(
                              context,
                              _fromColorKey,
                              () => Colors.grey,
                            ),
                          ),
                          tileColor: SharedAppData.getValue<Object, Color>(
                            context,
                            _fromColorKey,
                            () => Colors.grey,
                          ).withOpacity(0.2),
                        ),
                        ListTile(
                          title: const Text('Color to'),
                          onTap: () async {
                            final color = await _selectColor(context: context);
                            if (color != null) {
                              SharedAppData.setValue(
                                context,
                                _toColorKey,
                                color,
                              );
                            }
                          },
                          trailing: _ColorWidget(
                            color: SharedAppData.getValue(
                              context,
                              _toColorKey,
                              () => Colors.green,
                            ),
                          ),
                          tileColor: SharedAppData.getValue<Object, Color>(
                            context,
                            _toColorKey,
                            () => Colors.grey,
                          ).withOpacity(0.2),
                        ),
                      ],
                    ),
                  );
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
            fromColor: SharedAppData.getValue(
              context,
              _fromColorKey,
              () => Colors.grey,
            ),
            toColor: SharedAppData.getValue(
              context,
              _toColorKey,
              () => Colors.green,
            ),
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

class _ColorWidget extends StatelessWidget {
  final Color color;

  const _ColorWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
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
                      child: _ColorWidget(color: color),
                    ))
                .toList(),
          ),
        ),
      ),
    );
