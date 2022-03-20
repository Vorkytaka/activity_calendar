import 'package:activity_calendar/activity_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('_calculateChildCount', () {
    Future<void> _calculateChildCount(
      WidgetTester tester,
      int weekday,
      List<int> expectChildCount,
    ) async {
      assert(weekday > 0 && weekday <= 7);
      for (int i = 0; i < expectChildCount.length; i++) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ActivityCalendar(
                activities: List.generate(i + 1, (index) => index),
                weekday: weekday,
              ),
            ),
          ),
        );

        final widget = tester.widget<GridView>(find.byType(GridView));
        final delegate = widget.childrenDelegate as SliverChildBuilderDelegate;

        expect(delegate.childCount, expectChildCount[i]);
      }
    }

    testWidgets(
      'Sunday',
      (WidgetTester tester) async => _calculateChildCount(
        tester,
        DateTime.sunday,
        [7, 7, 7, 7, 7, 7, 7, 14, 14, 14, 14, 14, 14, 14, 21],
      ),
    );

    // *****--
    // *******
    // ----***
    testWidgets(
      'Saturday',
      (WidgetTester tester) async => _calculateChildCount(
        tester,
        DateTime.saturday,
        [7, 7, 7, 7, 7, 7, 14, 14, 14, 14, 14, 14, 14, 21, 21],
      ),
    );

    testWidgets(
      'Friday',
      (WidgetTester tester) async => _calculateChildCount(
        tester,
        DateTime.friday,
        [7, 7, 7, 7, 7, 14, 14, 14, 14, 14, 14, 14, 21, 21, 21],
      ),
    );

    testWidgets(
      'Thursday',
      (WidgetTester tester) async => _calculateChildCount(
        tester,
        DateTime.thursday,
        [7, 7, 7, 7, 14, 14, 14, 14, 14, 14, 14, 21, 21, 21, 21],
      ),
    );

    testWidgets(
      'Wednesday',
      (WidgetTester tester) async => _calculateChildCount(
        tester,
        DateTime.wednesday,
        [7, 7, 7, 14, 14, 14, 14, 14, 14, 14, 21, 21, 21, 21, 21],
      ),
    );

    testWidgets(
      'Tuesday',
      (WidgetTester tester) async => _calculateChildCount(
        tester,
        DateTime.tuesday,
        [7, 7, 14, 14, 14, 14, 14, 14, 14, 21, 21, 21, 21, 21, 21],
      ),
    );

    testWidgets(
      'Monday',
      (WidgetTester tester) async => _calculateChildCount(
        tester,
        DateTime.monday,
        [7, 14, 14, 14, 14, 14, 14, 14, 21, 21, 21, 21, 21, 21, 21],
      ),
    );
  });

  group('calculateIndex', () {
    // helper function to test `calculateIndex`
    void _calculateIndex(int weekday, List<int> matchers) {
      assert(matchers.length > 1);
      for (int i = 0; i < matchers.length; i++) {
        expect(
          ActivityCalendar.calculateIndex(i, weekday),
          matchers[i],
          reason: 'Error on matcher[$i]',
        );
      }
    }

    test(
        'Sunday',
        () => _calculateIndex(DateTime.sunday,
            [6, 5, 4, 3, 2, 1, 0, 13, 12, 11, 10, 9, 8, 7, 20, 19, 18]));

    test(
        'Saturday',
        () => _calculateIndex(DateTime.saturday,
            [5, 4, 3, 2, 1, 0, -1, 12, 11, 10, 9, 8, 7, 6, 19, 18, 17]));

    test(
        'Friday',
        () => _calculateIndex(DateTime.friday,
            [4, 3, 2, 1, 0, -1, -2, 11, 10, 9, 8, 7, 6, 5, 18, 17, 16]));

    test(
        'Thusday',
        () => _calculateIndex(DateTime.thursday,
            [3, 2, 1, 0, -1, -2, -3, 10, 9, 8, 7, 6, 5, 4, 17, 16, 15]));

    test(
        'Wednesday',
        () => _calculateIndex(DateTime.wednesday,
            [2, 1, 0, -1, -2, -3, -4, 9, 8, 7, 6, 5, 4, 3, 16, 15, 14]));

    test(
        'Tuesday',
        () => _calculateIndex(DateTime.tuesday,
            [1, 0, -1, -2, -3, -4, -5, 8, 7, 6, 5, 4, 3, 2, 15, 14, 13]));

    test(
        'Monday',
        () => _calculateIndex(DateTime.monday,
            [0, -1, -2, -3, -4, -5, -6, 7, 6, 5, 4, 3, 2, 1, 14, 13, 12]));
  });

  testWidgets('Default values', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ActivityCalendar(
            activities: [1, 2, 3, 4, 5],
          ),
        ),
      ),
    );

    final widget =
        tester.widget<ActivityCalendar>(find.byType(ActivityCalendar));

    expect(widget.fromColor, null);
    expect(widget.toColor, null);
    expect(widget.steps, 5);
    expect(widget.weekday, null);
    expect(widget.spacing, 3);
    expect(widget.scrollDirection, Axis.vertical);
    expect(widget.reverse, false);
  });

  testWidgets('Default tiles colors', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ActivityCalendar(
            activities: [0, 1, 2, 3, 4],
          ),
        ),
      ),
    );

    // Default light theme colors:
    // Surface: Color(0xffffffff)
    // Primary: MaterialColor(primary value: Color(0xff2196f3))

    final containers = tester
        .widgetList<Container>(find.byType(Container))
        .toList(growable: false);

    final expectColors = [
      const Color(0xff2196f3), // default to color
      const Color(0xff58b0f6),
      const Color(0xff90caf9),
      const Color(0xffc7e4fc),
      const Color(0xffffffff), // default from color
    ];

    for (int i = 0; i < containers.length; i++) {
      expect(
        (containers[i].decoration as BoxDecoration).color,
        expectColors[i],
      );
    }
  });

  testWidgets('Default values', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ActivityCalendar(
            activities: [1, 2, 3, 4, 5],
          ),
        ),
      ),
    );

    final widget = tester.widget<GridView>(find.byType(GridView));
    print((widget.childrenDelegate as SliverChildBuilderDelegate).childCount);
  });
}
