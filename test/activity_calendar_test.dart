import 'package:activity_calendar/activity_calendar.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('calculateChildCount', () {
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
}

List<int> _list(int length) => List.generate(length, (index) => index);
