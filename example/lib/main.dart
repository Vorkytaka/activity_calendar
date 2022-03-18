import 'dart:math';

import 'package:activity_calendar/activity_calendar.dart';
import 'package:flutter/cupertino.dart';
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
                        _ColorMenuItem(
                          title: 'Color from',
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
                          color: _sharedFromColor(context),
                        ),
                        _ColorMenuItem(
                          title: 'Color to',
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
                          color: _sharedToColor(context),
                        ),
                        ListTile(
                          title: const Text('Days count'),
                          trailing: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              value: _sharedDaysCount(context),
                              items: const [
                                DropdownMenuItem(child: Text('1'), value: 1),
                                DropdownMenuItem(child: Text('7'), value: 7),
                                DropdownMenuItem(child: Text('30'), value: 30),
                                DropdownMenuItem(
                                    child: Text('365'), value: 365),
                                DropdownMenuItem(
                                    child: Text('1000'), value: 1000),
                              ],
                              onChanged: (value) => SharedAppData.setValue(
                                context,
                                _daysCountKey,
                                value,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text('Weekday'),
                          trailing: DropdownButtonHideUnderline(
                            child: DropdownButton<int>(
                              value: _sharedWeekday(context),
                              items: [
                                for (int i = 0; i < _weekdays.length; i++)
                                  DropdownMenuItem(
                                    value: i + 1,
                                    child: Text(_weekdayFormat.format(
                                      _weekdays[i],
                                    )),
                                  ),
                              ],
                              onChanged: (value) => SharedAppData.setValue(
                                context,
                                _weekdayKey,
                                value,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text('Orientation'),
                          trailing: DropdownButtonHideUnderline(
                            child: DropdownButton<Axis>(
                              value: _sharedOrientation(context),
                              items: [
                                for (final axis in Axis.values)
                                  DropdownMenuItem(
                                    value: axis,
                                    child: Text(axis.toString()),
                                  ),
                              ],
                              onChanged: (value) => SharedAppData.setValue(
                                context,
                                _orientationKey,
                                value,
                              ),
                            ),
                          ),
                        )
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
          body: SizedBox(
            height: _sharedOrientation(context) == Axis.horizontal
                ? 200
                : double.maxFinite,
            child: ActivityCalendar(
              activities: rl(_sharedDaysCount(context)),
              fromColor: _sharedFromColor(context),
              toColor: _sharedToColor(context),
              steps: 5,
              borderRadius: BorderRadius.circular(4),
              weekday: _sharedWeekday(context),
              scrollDirection: _sharedOrientation(context),
              reverse: _sharedOrientation(context) == Axis.horizontal,
            ),
          ),
        ),
      ),
    );
  }

  static final r = Random();

  static List<int> rl([int length = 365]) =>
      List.generate(length, (index) => r.nextInt(10));
}

final Object _fromColorKey = Object();
final Object _toColorKey = Object();
final Object _daysCountKey = Object();
final Object _weekdayKey = Object();
final Object _orientationKey = Object();

Color _sharedFromColor(BuildContext context) =>
    SharedAppData.getValue<Object, Color>(
      context,
      _fromColorKey,
      () => Colors.grey.shade900,
    );

Color _sharedToColor(BuildContext context) =>
    SharedAppData.getValue<Object, Color>(
      context,
      _toColorKey,
      () => Colors.green,
    );

int _sharedDaysCount(BuildContext context) => SharedAppData.getValue(
      context,
      _daysCountKey,
      () => 365,
    );

int _sharedWeekday(BuildContext context) => SharedAppData.getValue(
      context,
      _weekdayKey,
      () => DateTime.now().weekday,
    );

Axis _sharedOrientation(BuildContext context) => SharedAppData.getValue(
      context,
      _orientationKey,
      () => Axis.vertical,
    );

class _ColorMenuItem extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final String title;

  const _ColorMenuItem({
    Key? key,
    required this.onTap,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      trailing: _ColorWidget(color: color),
      tileColor: color.withOpacity(0.2),
    );
  }
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
