import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ActivityCalendar extends StatelessWidget {
  final Color? fromColor;
  final Color? toColor;
  final int steps;
  final List<int> activity;
  final List<int> _segments;
  final List<Color> _colors;
  final List<Widget> _tiles;

  ActivityCalendar({
    Key? key,
    this.fromColor,
    this.toColor,
    this.steps = 5,
    required this.activity,
  })  : _segments = segments(
          activity.fold(0, (prev, curr) => curr > prev ? curr : prev),
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
        super(key: key);

  static int calculateIndex(int i, int dayOfWeek) {
    return 6 - i + (7 * ((i ~/ 7) * 2)) - (7 - dayOfWeek);
  }

  static List<Color> colors(Color from, Color to, int steps) {
    assert(steps >= 3);
    final dr = to.red - from.red;
    final dg = to.green - from.green;
    final db = to.green - from.green;
    return List.generate(
      steps,
      (i) => Color.fromARGB(
        255,
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
    throw UnimplementedError();
  }
}
