import 'package:activity_calendar/activity_calendar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('calculateChildCount', () {
    // *******
    // *******
    // ------*
    test('Sunday', () {
      const day = DateTime.sunday;

      expect(ActivityCalendar.calculateChildCount(_list(1), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(2), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(3), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(4), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(5), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(6), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(7), day), 7);

      expect(ActivityCalendar.calculateChildCount(_list(8), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(9), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(10), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(11), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(12), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(13), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(14), day), 14);

      expect(ActivityCalendar.calculateChildCount(_list(15), day), 21);
    });

    // ******-
    // *******
    // -----**
    test('Saturday', () {
      const day = DateTime.saturday;

      expect(ActivityCalendar.calculateChildCount(_list(1), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(2), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(3), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(4), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(5), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(6), day), 7);

      expect(ActivityCalendar.calculateChildCount(_list(7), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(8), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(9), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(10), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(11), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(12), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(13), day), 14);

      expect(ActivityCalendar.calculateChildCount(_list(14), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(15), day), 21);
    });

    // *****--
    // *******
    // ----***
    test('Friday', () {
      const day = DateTime.friday;

      expect(ActivityCalendar.calculateChildCount(_list(1), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(2), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(3), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(4), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(5), day), 7);

      expect(ActivityCalendar.calculateChildCount(_list(6), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(7), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(8), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(9), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(10), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(11), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(12), day), 14);

      expect(ActivityCalendar.calculateChildCount(_list(13), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(14), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(15), day), 21);
    });

    // ****---
    // *******
    // ---****
    test('Thursday', () {
      const day = DateTime.thursday;

      expect(ActivityCalendar.calculateChildCount(_list(1), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(2), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(3), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(4), day), 7);

      expect(ActivityCalendar.calculateChildCount(_list(5), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(6), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(7), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(8), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(9), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(10), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(11), day), 14);

      expect(ActivityCalendar.calculateChildCount(_list(12), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(13), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(14), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(15), day), 21);
    });

    // ***----
    // *******
    // --*****
    test('Wednesday', () {
      const day = DateTime.wednesday;

      expect(ActivityCalendar.calculateChildCount(_list(1), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(2), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(3), day), 7);

      expect(ActivityCalendar.calculateChildCount(_list(4), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(5), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(6), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(7), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(8), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(9), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(10), day), 14);

      expect(ActivityCalendar.calculateChildCount(_list(11), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(12), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(13), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(14), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(15), day), 21);
    });

    // **-----
    // *******
    // -******
    test('Tuesday', () {
      const day = DateTime.tuesday;

      expect(ActivityCalendar.calculateChildCount(_list(1), day), 7);
      expect(ActivityCalendar.calculateChildCount(_list(2), day), 7);

      expect(ActivityCalendar.calculateChildCount(_list(3), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(4), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(5), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(6), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(7), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(8), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(9), day), 14);

      expect(ActivityCalendar.calculateChildCount(_list(10), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(11), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(12), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(13), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(14), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(15), day), 21);
    });

    // *------
    // *******
    // *******
    test('Monday', () {
      const day = DateTime.monday;

      expect(ActivityCalendar.calculateChildCount(_list(1), day), 7);

      expect(ActivityCalendar.calculateChildCount(_list(2), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(3), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(4), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(5), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(6), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(7), day), 14);
      expect(ActivityCalendar.calculateChildCount(_list(8), day), 14);

      expect(ActivityCalendar.calculateChildCount(_list(9), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(10), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(11), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(12), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(13), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(14), day), 21);
      expect(ActivityCalendar.calculateChildCount(_list(15), day), 21);
    });
  });

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

  group('calculateIndex', () {
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
}

List<int> _list(int length) => List.generate(length, (index) => index);
