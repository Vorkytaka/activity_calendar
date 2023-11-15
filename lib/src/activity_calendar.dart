import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef IndexedOnTap = void Function(int index);

typedef TextTooltipBuilder = String Function(int index);

typedef RichTooltipBuilder = InlineSpan Function(int index);

/// Class that represent builder of tooltip for each item of [ActivityCalendar].
///
/// To create just one string tooltips use `TooltipBuilder.text` constructor.
/// If you need to customize part of your tooltip's message, then
/// you should use `TooltipBuilder.rich` constructor.
///
/// Both constructors have almost all arguments that [Tooltip] can have,
/// so you can customize it's behavior.
class TooltipBuilder {
  /// Rich text builder
  const TooltipBuilder.rich({
    required this.builder,
    this.decoration,
    this.preferBelow,
    this.padding,
    this.margin,
    this.verticalOffset,
    this.excludeFromSemantics,
    this.waitDuration,
    this.showDuration,
    this.triggerMode,
    this.enableFeedback,
  });

  /// Simple text builder.
  /// Have optional `TextStyle? textStyle` argument.
  TooltipBuilder.text({
    required TextTooltipBuilder builder,
    this.decoration,
    this.preferBelow,
    this.padding,
    this.margin,
    this.verticalOffset,
    this.excludeFromSemantics,
    TextStyle? textStyle,
    this.waitDuration,
    this.showDuration,
    this.triggerMode,
    this.enableFeedback,
  }) : builder = ((int i) => TextSpan(text: builder(i), style: textStyle));

  /// Builder that will be use for generate messages for tooltips
  final RichTooltipBuilder builder;

  /// The amount of space by which to inset the tooltip's [child].
  ///
  /// Defaults to 16.0 logical pixels in each direction.
  final EdgeInsetsGeometry? padding;

  /// The empty space that surrounds the tooltip.
  ///
  /// Defines the tooltip's outer [Container.margin]. By default, a
  /// long tooltip will span the width of its window. If long enough,
  /// a tooltip might also span the window's height. This property allows
  /// one to define how much space the tooltip must be inset from the edges
  /// of their display window.
  ///
  /// If this property is null, then [TooltipThemeData.margin] is used.
  /// If [TooltipThemeData.margin] is also null, the default margin is
  /// 0.0 logical pixels on all sides.
  final EdgeInsetsGeometry? margin;

  /// The vertical gap between the widget and the displayed tooltip.
  ///
  /// When [preferBelow] is set to true and tooltips have sufficient space to
  /// display themselves, this property defines how much vertical space
  /// tooltips will position themselves under their corresponding widgets.
  /// Otherwise, tooltips will position themselves above their corresponding
  /// widgets with the given offset.
  final double? verticalOffset;

  /// Whether the tooltip defaults to being displayed below the widget.
  ///
  /// Defaults to true. If there is insufficient space to display the tooltip in
  /// the preferred direction, the tooltip will be displayed in the opposite
  /// direction.
  final bool? preferBelow;

  /// Whether the tooltip's [message] or [richMessage] should be excluded from
  /// the semantics tree.
  ///
  /// Defaults to false. A tooltip will add a [Semantics] label that is set to
  /// [Tooltip.message] if non-null, or the plain text value of
  /// [Tooltip.richMessage] otherwise. Set this property to true if the app is
  /// going to provide its own custom semantics label.
  final bool? excludeFromSemantics;

  /// Specifies the tooltip's shape and background color.
  ///
  /// The tooltip shape defaults to a rounded rectangle with a border radius of
  /// 4.0. Tooltips will also default to an opacity of 90% and with the color
  /// [Colors.grey]\[700\] if [ThemeData.brightness] is [Brightness.dark], and
  /// [Colors.white] if it is [Brightness.light].
  final Decoration? decoration;

  /// The length of time that a pointer must hover over a tooltip's widget
  /// before the tooltip will be shown.
  ///
  /// Defaults to 0 milliseconds (tooltips are shown immediately upon hover).
  final Duration? waitDuration;

  /// The length of time that the tooltip will be shown after a long press
  /// is released or mouse pointer exits the widget.
  ///
  /// Defaults to 1.5 seconds for long press released or 0.1 seconds for mouse
  /// pointer exits the widget.
  final Duration? showDuration;

  /// The [TooltipTriggerMode] that will show the tooltip.
  ///
  /// If this property is null, then [TooltipThemeData.triggerMode] is used.
  /// If [TooltipThemeData.triggerMode] is also null, the default mode is
  /// [TooltipTriggerMode.longPress].
  final TooltipTriggerMode? triggerMode;

  /// Whether the tooltip should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// When null, the default value is true.
  ///
  /// See also:
  ///
  ///  * [Feedback], for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;
}

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
  /// See [TooltipBuilder] for more info.
  ///
  /// If [null] then items will have no tooltips.
  ///
  /// Work by default [Tooltip] class, so it's already adaptive.
  final TooltipBuilder? tooltipBuilder;

  /// {@macro flutter.widgets.scroll_view.scrollDirection}
  final Axis scrollDirection;

  /// {@macro flutter.widgets.scroll_view.reverse}
  final bool reverse;

  final EdgeInsetsGeometry? padding;

  /// {@macro flutter.widgets.scroll_view.physics}
  final ScrollPhysics? physics;

  /// {@macro flutter.widgets.scroll_view.shrinkWrap}
  final bool shrinkWrap;

  /// {@macro flutter.material.Material.clipBehavior}
  final Clip clipBehavior;

  /// {@macro flutter.widgets.scrollable.dragStartBehavior}
  final DragStartBehavior dragStartBehavior;

  /// {@macro flutter.widgets.scroll_view.keyboardDismissBehavior}
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  /// {@macro flutter.widgets.scrollable.restorationId}
  final String? restorationId;

  /// {@macro flutter.widgets.scrollable.semanticChildCount}
  final int? semanticChildCount;

  /// {@macro flutter.rendering.RenderViewportBase.cacheExtent}
  final double? cacheExtent;

  /// {@macro flutter.widgets.scroll_view.primary}
  final bool? primary;

  /// {@macro flutter.widgets.scroll_view.controller}
  final ScrollController? controller;

  final bool addAutomaticKeepAlives;

  final bool addRepaintBoundaries;

  final bool addSemanticIndexes;

  /// Calculate index of the item relative to the weekday and start weekday of locale.
  ///
  /// The problems is:
  /// * Our indexes is reversed in line, because our dates goes backward.
  /// * Also we have an offset with first weekday of the locale.
  ///
  /// So, for example, our grid:
  ///
  ///   M | T | W | T | F | S | S
  ///   -|-|-|-|-|-|-
  ///   0 | 1 | 2 | 3 | 4 | 5 | 6
  ///   7 | 8 | 9 | 10 | 11 | 12 | 13
  ///
  /// will be transform to the:
  ///
  ///   M | T | W | T | F | S | S
  ///   -|-|-|-|-|-|-
  ///   6 | 5 | 4 | 3 | 2 | 1 | 0
  ///   13 | 12 | 11 | 10 | 9 | 8 | 7
  ///
  /// after that, we need to add offset to the weekday that we are start with,
  /// so, if we start with Wednesday, then it will be
  ///
  ///   M | T | W | T | F | S | S
  ///   -|-|-|-|-|-|-
  ///   2 | 1 | 0 | -1 | -2 | -3 | -4
  ///   9 | 8 | 7 | 6 | 5 | 4 | 3
  ///
  /// From that moment, we have right index for our days.
  /// As we can see from the table, our 0 index is Wednesday, 1 is Tuesday, etc.
  /// Negative indexes will be ignored.
  ///
  /// But, after that we still have a problem with different first weekday.
  /// If some countries first weekday is monday, somewhere is sunday or even saturday.
  ///
  /// So, when we count offset, we add extra offset for the first weekday of local.
  /// See [weekdayOffset] for more info.
  static int calculateIndex(
    int index,
    int offset,
  ) {
    // Reverse current index relatively to current line
    // Simple: `max + min - value`
    final line = index ~/ DateTime.daysPerWeek;
    index = (7 * (line + 1) - 1) + (7 * line) - index;

    // Count index relative to current weekday with offset to start weekday
    index = index - offset;

    return index;
  }

  /// Get offset for the [firstWeekday] of current locale relate to the [weekday].
  ///
  /// Each locale can has it own first day of the week.
  /// For example, in Russia is monday, in USA is sunday and in UAE is Saturday.
  ///
  /// So, to handle each of it, we need to add some offset to our index, that mapped in this function.
  ///
  /// For example, if we have Saturday as a first weekday, then we have this list:
  ///
  ///   Sat | Sun | Mon | Tue | Wed | Thu | Fri
  ///    6  |  7  |  1  |  2  |  3  |  4  |  5
  ///
  /// But we need:
  ///
  ///   Sat | Sun | Mon | Tue | Wed | Thu | Fri
  ///    1  |  2  |  3  |  4  |  5  |  6  |  7
  ///
  /// So, to have a right offset, we need to move each day back for 2 steps.
  ///
  /// {@template offset_info}
  /// So, offset is how many from end of first line we need to move,
  /// so we have right indexes. For example:
  ///
  ///   M | T | W | T | F | S | S
  ///   2 | 1 | 0 | - | - | - | -
  ///   - | - | 7 | 6 | 5 | 4 | 3
  ///
  /// Here our first index is 0, it's Wednesday.
  /// And we have 4 empty indexes. That's what offset about.
  /// {@endtemplate}
  static int weekdayOffset(int weekday, int firstWeekday) {
    assert(weekday >= 0 && weekday <= 7);
    assert(firstWeekday >= 0 && firstWeekday <= 7);

    // The easiest way to get right offset
    final int offset;
    switch (firstWeekday) {
      case 7: // Sunday
      case 0: // Sunday from MaterialLocalization
        offset = 1;
        break;
      case 6: // Saturday
        offset = 2;
        break;
      case 5: // Friday
        offset = 3;
        break;
      case 4: // Thursday
        offset = 4;
        break;
      case 3: // Wednesday
        offset = 5;
        break;
      case 2: // Tuesday
        offset = 6;
        break;
      default: // Monday
        offset = 0;
        break;
    }

    return (7 - weekday - offset) % 7;
  }

  /// Helper method that calculate the actual child count for given data.
  ///
  /// [count] is the count of the children.
  /// [offset] is the start weekday offset. See [weekdayOffset].
  ///
  /// {@macro offset}
  ///
  /// Here we have 8 children, but also 6 empty elements.
  /// So, our _actual_ child count will be 14.
  static int calculateChildCount(int count, int offset) {
    return ((count + offset) / 7).ceil() * 7;
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

    final localizations = Localizations.of<MaterialLocalizations>(
      context,
      MaterialLocalizations,
    );
    final startWeekday = localizations?.firstDayOfWeekIndex ?? DateTime.monday;
    final offset = weekdayOffset(weekday, startWeekday);
    final childCount = calculateChildCount(segments.length, offset);

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
      itemCount: childCount,
      itemBuilder: (context, i) {
        final index = calculateIndex(i, offset);
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
            richMessage: tooltipBuilder!.builder(index),
            decoration: tooltipBuilder!.decoration,
            preferBelow: tooltipBuilder!.preferBelow,
            margin: tooltipBuilder!.margin,
            showDuration: tooltipBuilder!.showDuration,
            padding: tooltipBuilder!.padding,
            enableFeedback: tooltipBuilder!.enableFeedback,
            excludeFromSemantics: tooltipBuilder!.excludeFromSemantics,
            triggerMode: tooltipBuilder!.triggerMode,
            verticalOffset: tooltipBuilder!.verticalOffset,
            waitDuration: tooltipBuilder!.waitDuration,
            child: item,
          );
        }

        return item;
      },
    );
  }
}
