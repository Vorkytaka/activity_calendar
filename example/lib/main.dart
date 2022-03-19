import 'dart:math';

import 'package:activity_calendar/activity_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const ExampleApp());
}

/// Data

final _random = Random();

List<int> _randomActivities([int length = 365, int max = 10]) =>
    List.generate(length, (index) => _random.nextInt(max));

final List<int> _activities = _randomActivities(1000, 10);

final DateFormat _weekdayFormat = DateFormat.E();

/// Names of weekdays from monday to sunday
final List<String> _weekdays =
    List.generate(7, (i) => _weekdayFormat.format(DateTime(2000, 0, 6 + i)));

/// App

class ExampleApp extends StatelessWidget {
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
            backgroundColor: Colors.grey[850],
            elevation: 3,
            centerTitle: false,
            actions: [
              IconButton(
                icon: Icon(Icons.adaptive.more),
                onPressed: () => _showSettings(context: context),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(24),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Wrap(
                    spacing: 4,
                    runAlignment: WrapAlignment.start,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      const Text('Less'),
                      ...ActivityCalendar.tiles(
                        _sharedFromColor(context),
                        _sharedToColor(context),
                        5,
                        5,
                        const BorderRadius.all(Radius.circular(4)),
                      ).values.map((e) => SizedBox(
                            width: 24,
                            height: 24,
                            child: e,
                          )),
                      const Text('More'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: _Body(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = _sharedOrientation(context);
    final isVertical = orientation == Axis.vertical;

    final calendar = ActivityCalendar(
      activities: _activities.sublist(0, _sharedDaysCount(context)),
      fromColor: _sharedFromColor(context),
      toColor: _sharedToColor(context),
      steps: 5,
      borderRadius: BorderRadius.circular(4),
      weekday: _sharedWeekday(context),
      scrollDirection: _sharedOrientation(context),
      reverse: _sharedOrientation(context) == Axis.horizontal,
      tooltipBuilder: (i) => '${_activities[i]} contributions',
    );

    if (isVertical) {
      return Column(
        children: [
          Row(
            children: [
              for (final weekday in _weekdays)
                Expanded(
                  child: Center(
                    child: Text(
                      weekday,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: calendar,
          ),
        ],
      );
    }

    return SizedBox(
      height: 200,
      child: Row(
        children: [
          Column(
            children: [
              for (final weekday in _weekdays)
                Expanded(
                  child: Center(
                    child: Text(
                      weekday,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: calendar,
          ),
        ],
      ),
    );
  }
}

/// SharedAppData section

final Object _fromColorKey = Object();
final Object _toColorKey = Object();
final Object _daysCountKey = Object();
final Object _weekdayKey = Object();
final Object _orientationKey = Object();

Color _sharedFromColor(BuildContext context) =>
    SharedAppData.getValue<Object, Color>(
      context,
      _fromColorKey,
      () => Theme.of(context).colorScheme.surface,
    );

Color _sharedToColor(BuildContext context) =>
    SharedAppData.getValue<Object, Color>(
      context,
      _toColorKey,
      () => Theme.of(context).colorScheme.primary,
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

/// Helpful widgets

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

/// Dialogs

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

Future<void> _showSettings({required BuildContext context}) =>
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
                  DropdownMenuItem(child: Text('365'), value: 365),
                  DropdownMenuItem(child: Text('1000'), value: 1000),
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
                      child: Text(_weekdays[i]),
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
