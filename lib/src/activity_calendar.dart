import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityCalendar extends StatelessWidget {
  final Color? fromColor;
  final Color? toColor;
  final int steps;
  final List<int> activities;
  final List<int> _segments;
  final List<Color> _colors;
  final List<Widget> _tiles;
  final Map<int, Widget> _mapOfTiles;

  ActivityCalendar({
    Key? key,
    this.fromColor,
    this.toColor,
    this.steps = 5,
    required this.activities,
  })  : _segments = segments(
          activities.fold(0, (prev, curr) => curr > prev ? curr : prev),
          steps,
        ),
        _colors = colors(
          fromColor ?? Colors.grey,
          toColor ?? Colors.green,
          steps,
        ),
        _tiles = colors(
          fromColor ?? Colors.grey,
          toColor ?? Colors.green,
          steps,
        ).map((color) => ColoredBox(color: color)).toList(growable: false),
        _mapOfTiles = _t(
          fromColor ?? Colors.grey,
          toColor ?? Colors.green,
          steps,
          activities.fold(0, (prev, curr) => curr > prev ? curr : prev),
        ),
        super(key: key);

  static int calculateIndex(int i, int dayOfWeek) {
    return 6 - i + (7 * ((i ~/ 7) * 2)) - (7 - dayOfWeek);
  }

  static Map<int, Widget> _t(Color from, Color to, int steps, int max) {
    final map = <int, Widget>{};
    final da = to.alpha - from.alpha;
    final dr = to.red - from.red;
    final dg = to.green - from.green;
    final db = to.green - from.green;
    for (int i = 0; i < max; i++) {
      final index = (i * (max / (steps - 1))).toInt();
      final color = Color.fromARGB(
        (from.alpha + i * (da / (steps - 1))).toInt(),
        (from.red + i * (dr / (steps - 1))).toInt(),
        (from.green + i * (dg / (steps - 1))).toInt(),
        (from.blue + i * (db / (steps - 1))).toInt(),
      );
      map[index] = ColoredBox(color: color);
    }

    return map;
  }

  static List<Color> colors(Color from, Color to, int steps) {
    assert(steps >= 3);
    final da = to.alpha - from.alpha;
    final dr = to.red - from.red;
    final dg = to.green - from.green;
    final db = to.green - from.green;
    return List.generate(
      steps,
      (i) => Color.fromARGB(
        (from.alpha + i * (da / (steps - 1))).toInt(),
        (from.red + i * (dr / (steps - 1))).toInt(),
        (from.green + i * (dg / (steps - 1))).toInt(),
        (from.blue + i * (db / (steps - 1))).toInt(),
      ),
      growable: false,
    );
  }

  static List<int> segments(int max, int steps) {
    assert(steps >= 3);
    return List.generate(
      steps,
      (i) => (i * (max / (steps - 1))).toInt(),
      growable: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return GridView.builder(
      // scrollDirection: Axis.horizontal,
      // reverse: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: activities.length + (7 - today.weekday) + 6,
      itemBuilder: (context, i) {
        final index = calculateIndex(i, today.weekday);
        if (index < 0 || index >= activities.length) {
          return const SizedBox();
        }

        final activity = activities[index];
        final segment = getSegment(activity);
        return _mapOfTiles[segment]!;
      },
    );
  }

  int getSegment(int activity) {
    return _mapOfTiles.keys.firstWhere((key) => activity <= key);
  }
}
