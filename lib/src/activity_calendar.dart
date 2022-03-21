import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef IndexedOnTap = void Function(int index);

typedef TooltipBuilder = String Function(int index);

class ActivityCalendar extends StatelessWidget {
  const ActivityCalendar({
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
    this.physics,
    this.shrinkWrap = false,
    this.clipBehavior = Clip.hardEdge,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.semanticChildCount,
    this.cacheExtent,
    this.primary,
    this.controller,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.tooltipBuilder,
  })  : assert(steps >= 2),
        super(key: key);

  /// Color that represents item with no activity.
  /// If [null], then use Theme's [ColorScheme.surface].
  final Color? fromColor;

  /// Color that represents item with max activity.
  /// If [null], then use Theme's [ColorScheme.primary].
  final Color? toColor;

  /// Count of color steps including [fromColor] and [toColor].
  /// By default is 5.
  final int steps;

  /// List of activity per days.
  /// Each index represent another day from first one to last one.
  final List<int> activities;

  /// Weekday that calendar starts from.
  /// If [null], then check today weekday.
  ///
  /// Use [DateTime] weekdays constants for that.
  final int? weekday;

  /// Spacing between elements, both horizontal and vertical.
  /// By default is 3.
  final double spacing;

  /// Optional on tap callback.
  /// Gives index of item by [activities].
  final IndexedOnTap? onTap;

  /// Border radius of each item.
  /// By default radius is 8.
  final BorderRadius borderRadius;

  /// Optional tooltip builder for each item.
  /// Gives index of item by [activities].
  /// Must return [String] that will use for item's tooltip.
  ///
  /// Work by default [Tooltip] class, so it's already adaptive.
  final TooltipBuilder? tooltipBuilder;

  /// {@macro flutter.widgets.scrollable.scrollDirection}
  final Axis scrollDirection;

  /// {@macro flutter.widgets.scrollable.reverse}
  final bool reverse;

  /// {@macro flutter.widgets.scrollable.padding}
  final EdgeInsetsGeometry? padding;

  /// {@macro flutter.widgets.scrollable.physics}
  final ScrollPhysics? physics;

  /// {@macro flutter.widgets.scrollable.shrinkWrap}
  final bool shrinkWrap;

  /// {@macro flutter.widgets.scrollable.clipBehavior}
  final Clip clipBehavior;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@macro flutter.widgets.scrollable.keyboardDismissBehavior}
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  /// {@macro flutter.widgets.scrollable.restorationId}
  final String? restorationId;

  /// {@macro flutter.widgets.scrollable.semanticChildCount}
  final int? semanticChildCount;

  /// {@macro flutter.widgets.scrollable.cacheExtent}
  final double? cacheExtent;

  /// {@macro flutter.widgets.scrollable.primary}
  final bool? primary;

  /// {@macro flutter.widgets.scrollable.controller}
  final ScrollController? controller;

  /// {@macro flutter.widgets.scrollable.addAutomaticKeepAlives}
  final bool addAutomaticKeepAlives;

  /// {@macro flutter.widgets.scrollable.addRepaintBoundaries}
  final bool addRepaintBoundaries;

  /// {@macro flutter.widgets.scrollable.addSemanticIndexes}
  final bool addSemanticIndexes;

  /// Helper method that calculate the actual index of item.
  static int _calculateIndex(int i, int weekday) {
    return 6 - i + (7 * ((i ~/ 7) * 2)) - (7 - weekday);
  }

  /// Helper method that calculate the actual child count for given data.
  static int _calculateChildCount(List<int> activities, int weekday) {
    return activities.length + // actually days
        (7 - weekday) + // skip in first line
        (7 - (activities.length + 7 - weekday) % 7) % 7; // skip on last line
  }

  /// Helper method that give us map of each step to it's widget.
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

    final mapOfTiles = tiles(
      fromColor ?? Theme.of(context).colorScheme.surface,
      toColor ?? Theme.of(context).colorScheme.primary,
      steps,
      activities.fold(0, (prev, curr) => curr > prev ? curr : prev),
      borderRadius,
    );

    int _findSegment(int activity) {
      return mapOfTiles.keys.firstWhere(
        (key) => activity <= key,
        orElse: () => mapOfTiles.keys.last,
      );
    }

    // Calculate segments (steps) once, so we don't do it every time.
    final segments = List.generate(
      activities.length,
      (i) => _findSegment(activities[i]),
      growable: false,
    );

    return GridView.builder(
      padding: padding,
      scrollDirection: scrollDirection,
      reverse: reverse,
      physics: physics,
      shrinkWrap: shrinkWrap,
      clipBehavior: clipBehavior,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      semanticChildCount: semanticChildCount,
      cacheExtent: cacheExtent,
      primary: primary,
      controller: controller,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
      ),
      itemCount: _calculateChildCount(segments, weekday),
      itemBuilder: (context, i) {
        final index = _calculateIndex(i, weekday);
        if (index < 0 || index >= activities.length) {
          return const SizedBox();
        }

        final segment = segments[index];
        Widget item = mapOfTiles[segment]!;

        if (onTap != null) {
          item = GestureDetector(
            onTap: () => onTap!(index),
            child: item,
          );
        }

        if (tooltipBuilder != null) {
          item = Tooltip(
            message: tooltipBuilder!(index),
            child: item,
          );
        }

        return item;
      },
    );
  }
}
