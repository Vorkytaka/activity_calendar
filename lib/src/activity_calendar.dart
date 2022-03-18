import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

typedef IndexedOnTap = void Function(int index);

class ActivityCalendar extends StatelessWidget {
  final Color? fromColor;
  final Color? toColor;
  final int steps;
  final List<int> activities;
  final Map<int, Widget> _mapOfTiles;
  final int? weekday;
  final double spacing;
  final Axis scrollDirection;
  final bool reverse;
  final IndexedOnTap? onTap;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? padding;

  ActivityCalendar({
    Key? key,
    this.fromColor,
    this.toColor,
    this.steps = 5,
    required this.activities,
    this.weekday,
    this.spacing = 3,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.onTap,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.padding,
  })  : _mapOfTiles = tiles(
          fromColor ?? Colors.grey,
          toColor ?? Colors.green,
          steps,
          activities.fold(0, (prev, curr) => curr > prev ? curr : prev),
          borderRadius,
        ),
        super(key: key);

  static int calculateIndex(int i, int weekday) {
    return 6 - i + (7 * ((i ~/ 7) * 2)) - (7 - weekday);
  }

  static int calculateChildCount(List<int> activities, int weekday) {
    return activities.length + // actually days
        (7 - weekday) + // skip in first line
        (7 - (activities.length + 7 - weekday) % 7) % 7; // skip on last line
  }

  static Map<int, Widget> tiles(
    Color from,
    Color to,
    int steps,
    int max,
    BorderRadius borderRadius,
  ) {
    final map = <int, Widget>{};
    final da = to.alpha - from.alpha;
    final dr = to.red - from.red;
    final dg = to.green - from.green;
    final db = to.blue - from.blue;
    for (int i = 0; i < steps; i++) {
      final index = (i * (max / (steps - 1))).toInt();
      final color = Color.fromARGB(
        (from.alpha + i * (da / (steps - 1))).toInt(),
        (from.red + i * (dr / (steps - 1))).toInt(),
        (from.green + i * (dg / (steps - 1))).toInt(),
        (from.blue + i * (db / (steps - 1))).toInt(),
      );
      map[index] = Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
      );
    }

    return map;
  }

  @override
  Widget build(BuildContext context) {
    final weekday = this.weekday ?? DateTime.now().weekday;
    return GridView.builder(
      padding: padding,
      scrollDirection: scrollDirection,
      reverse: reverse,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      itemCount: calculateChildCount(activities, weekday),
      itemBuilder: (context, i) {
        final index = calculateIndex(i, weekday);
        if (index < 0 || index >= activities.length) {
          return const SizedBox();
        }

        final activity = activities[index];
        final segment = _findSegment(activity);

        Widget item = _mapOfTiles[segment]!;

        if (onTap != null) {
          item = GestureDetector(
            onTap: () => onTap!(index),
            child: item,
          );
        }

        return item;
      },
    );
  }

  int _findSegment(int activity) {
    return _mapOfTiles.keys.firstWhere(
      (key) => activity <= key,
      orElse: () => _mapOfTiles.keys.last,
    );
  }
}
