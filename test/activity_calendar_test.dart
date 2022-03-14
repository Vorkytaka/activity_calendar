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

  group('calculateIndex', () {
    test('Sunday', () {
      const day = DateTime.sunday;

      expect(ActivityCalendar.calculateIndex(0, day), 6);
      expect(ActivityCalendar.calculateIndex(1, day), 5);
      expect(ActivityCalendar.calculateIndex(2, day), 4);
      expect(ActivityCalendar.calculateIndex(3, day), 3);
      expect(ActivityCalendar.calculateIndex(4, day), 2);
      expect(ActivityCalendar.calculateIndex(5, day), 1);
      expect(ActivityCalendar.calculateIndex(6, day), 0);

      expect(ActivityCalendar.calculateIndex(7, day), 13);
      expect(ActivityCalendar.calculateIndex(8, day), 12);
      expect(ActivityCalendar.calculateIndex(9, day), 11);
      expect(ActivityCalendar.calculateIndex(10, day), 10);
      expect(ActivityCalendar.calculateIndex(11, day), 9);
      expect(ActivityCalendar.calculateIndex(12, day), 8);
      expect(ActivityCalendar.calculateIndex(13, day), 7);

      expect(ActivityCalendar.calculateIndex(14, day), 20);
      expect(ActivityCalendar.calculateIndex(15, day), 19);
      expect(ActivityCalendar.calculateIndex(16, day), 18);
    });

    test('Saturday', () {
      const day = DateTime.saturday;

      expect(ActivityCalendar.calculateIndex(0, day), 5);
      expect(ActivityCalendar.calculateIndex(1, day), 4);
      expect(ActivityCalendar.calculateIndex(2, day), 3);
      expect(ActivityCalendar.calculateIndex(3, day), 2);
      expect(ActivityCalendar.calculateIndex(4, day), 1);
      expect(ActivityCalendar.calculateIndex(5, day), 0);
      expect(ActivityCalendar.calculateIndex(6, day), -1);

      expect(ActivityCalendar.calculateIndex(7, day), 12);
      expect(ActivityCalendar.calculateIndex(8, day), 11);
      expect(ActivityCalendar.calculateIndex(9, day), 10);
      expect(ActivityCalendar.calculateIndex(10, day), 9);
      expect(ActivityCalendar.calculateIndex(11, day), 8);
      expect(ActivityCalendar.calculateIndex(12, day), 7);
      expect(ActivityCalendar.calculateIndex(13, day), 6);

      expect(ActivityCalendar.calculateIndex(14, day), 19);
      expect(ActivityCalendar.calculateIndex(15, day), 18);
      expect(ActivityCalendar.calculateIndex(16, day), 17);
    });

    test('Friday', () {
      const day = DateTime.friday;

      expect(ActivityCalendar.calculateIndex(0, day), 4);
      expect(ActivityCalendar.calculateIndex(1, day), 3);
      expect(ActivityCalendar.calculateIndex(2, day), 2);
      expect(ActivityCalendar.calculateIndex(3, day), 1);
      expect(ActivityCalendar.calculateIndex(4, day), 0);
      expect(ActivityCalendar.calculateIndex(5, day), -1);
      expect(ActivityCalendar.calculateIndex(6, day), -2);

      expect(ActivityCalendar.calculateIndex(7, day), 11);
      expect(ActivityCalendar.calculateIndex(8, day), 10);
      expect(ActivityCalendar.calculateIndex(9, day), 9);
      expect(ActivityCalendar.calculateIndex(10, day), 8);
      expect(ActivityCalendar.calculateIndex(11, day), 7);
      expect(ActivityCalendar.calculateIndex(12, day), 6);
      expect(ActivityCalendar.calculateIndex(13, day), 5);

      expect(ActivityCalendar.calculateIndex(14, day), 18);
      expect(ActivityCalendar.calculateIndex(15, day), 17);
      expect(ActivityCalendar.calculateIndex(16, day), 16);
    });

    test('Friday', () {
      const day = DateTime.friday;

      expect(ActivityCalendar.calculateIndex(0, day), 4);
      expect(ActivityCalendar.calculateIndex(1, day), 3);
      expect(ActivityCalendar.calculateIndex(2, day), 2);
      expect(ActivityCalendar.calculateIndex(3, day), 1);
      expect(ActivityCalendar.calculateIndex(4, day), 0);
      expect(ActivityCalendar.calculateIndex(5, day), -1);
      expect(ActivityCalendar.calculateIndex(6, day), -2);

      expect(ActivityCalendar.calculateIndex(7, day), 11);
      expect(ActivityCalendar.calculateIndex(8, day), 10);
      expect(ActivityCalendar.calculateIndex(9, day), 9);
      expect(ActivityCalendar.calculateIndex(10, day), 8);
      expect(ActivityCalendar.calculateIndex(11, day), 7);
      expect(ActivityCalendar.calculateIndex(12, day), 6);
      expect(ActivityCalendar.calculateIndex(13, day), 5);

      expect(ActivityCalendar.calculateIndex(14, day), 18);
      expect(ActivityCalendar.calculateIndex(15, day), 17);
      expect(ActivityCalendar.calculateIndex(16, day), 16);
    });

    test('Thursday', () {
      const day = DateTime.thursday;

      expect(ActivityCalendar.calculateIndex(0, day), 3);
      expect(ActivityCalendar.calculateIndex(1, day), 2);
      expect(ActivityCalendar.calculateIndex(2, day), 1);
      expect(ActivityCalendar.calculateIndex(3, day), 0);
      expect(ActivityCalendar.calculateIndex(4, day), -1);
      expect(ActivityCalendar.calculateIndex(5, day), -2);
      expect(ActivityCalendar.calculateIndex(6, day), -3);

      expect(ActivityCalendar.calculateIndex(7, day), 10);
      expect(ActivityCalendar.calculateIndex(8, day), 9);
      expect(ActivityCalendar.calculateIndex(9, day), 8);
      expect(ActivityCalendar.calculateIndex(10, day), 7);
      expect(ActivityCalendar.calculateIndex(11, day), 6);
      expect(ActivityCalendar.calculateIndex(12, day), 5);
      expect(ActivityCalendar.calculateIndex(13, day), 4);

      expect(ActivityCalendar.calculateIndex(14, day), 17);
      expect(ActivityCalendar.calculateIndex(15, day), 16);
      expect(ActivityCalendar.calculateIndex(16, day), 15);
    });

    test('Wednesday', () {
      const day = DateTime.wednesday;

      expect(ActivityCalendar.calculateIndex(0, day), 2);
      expect(ActivityCalendar.calculateIndex(1, day), 1);
      expect(ActivityCalendar.calculateIndex(2, day), 0);
      expect(ActivityCalendar.calculateIndex(3, day), -1);
      expect(ActivityCalendar.calculateIndex(4, day), -2);
      expect(ActivityCalendar.calculateIndex(5, day), -3);
      expect(ActivityCalendar.calculateIndex(6, day), -4);

      expect(ActivityCalendar.calculateIndex(7, day), 9);
      expect(ActivityCalendar.calculateIndex(8, day), 8);
      expect(ActivityCalendar.calculateIndex(9, day), 7);
      expect(ActivityCalendar.calculateIndex(10, day), 6);
      expect(ActivityCalendar.calculateIndex(11, day), 5);
      expect(ActivityCalendar.calculateIndex(12, day), 4);
      expect(ActivityCalendar.calculateIndex(13, day), 3);

      expect(ActivityCalendar.calculateIndex(14, day), 16);
      expect(ActivityCalendar.calculateIndex(15, day), 15);
      expect(ActivityCalendar.calculateIndex(16, day), 14);
    });

    test('Tuesday', () {
      const day = DateTime.tuesday;

      expect(ActivityCalendar.calculateIndex(0, day), 1);
      expect(ActivityCalendar.calculateIndex(1, day), 0);
      expect(ActivityCalendar.calculateIndex(2, day), -1);
      expect(ActivityCalendar.calculateIndex(3, day), -2);
      expect(ActivityCalendar.calculateIndex(4, day), -3);
      expect(ActivityCalendar.calculateIndex(5, day), -4);
      expect(ActivityCalendar.calculateIndex(6, day), -5);

      expect(ActivityCalendar.calculateIndex(7, day), 8);
      expect(ActivityCalendar.calculateIndex(8, day), 7);
      expect(ActivityCalendar.calculateIndex(9, day), 6);
      expect(ActivityCalendar.calculateIndex(10, day), 5);
      expect(ActivityCalendar.calculateIndex(11, day), 4);
      expect(ActivityCalendar.calculateIndex(12, day), 3);
      expect(ActivityCalendar.calculateIndex(13, day), 2);

      expect(ActivityCalendar.calculateIndex(14, day), 15);
      expect(ActivityCalendar.calculateIndex(15, day), 14);
      expect(ActivityCalendar.calculateIndex(16, day), 13);
    });

    test('Monday', () {
      const day = DateTime.monday;

      expect(ActivityCalendar.calculateIndex(0, day), 0);
      expect(ActivityCalendar.calculateIndex(1, day), -1);
      expect(ActivityCalendar.calculateIndex(2, day), -2);
      expect(ActivityCalendar.calculateIndex(3, day), -3);
      expect(ActivityCalendar.calculateIndex(4, day), -4);
      expect(ActivityCalendar.calculateIndex(5, day), -5);
      expect(ActivityCalendar.calculateIndex(6, day), -6);

      expect(ActivityCalendar.calculateIndex(7, day), 7);
      expect(ActivityCalendar.calculateIndex(8, day), 6);
      expect(ActivityCalendar.calculateIndex(9, day), 5);
      expect(ActivityCalendar.calculateIndex(10, day), 4);
      expect(ActivityCalendar.calculateIndex(11, day), 3);
      expect(ActivityCalendar.calculateIndex(12, day), 2);
      expect(ActivityCalendar.calculateIndex(13, day), 1);

      expect(ActivityCalendar.calculateIndex(14, day), 14);
      expect(ActivityCalendar.calculateIndex(15, day), 13);
      expect(ActivityCalendar.calculateIndex(16, day), 12);
    });
  });
}

List<int> _list(int length) => List.generate(length, (index) => index);
