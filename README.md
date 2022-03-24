# Activity Calendar

[![pub package](https://img.shields.io/pub/v/activity_calendar.svg)](https://pub.dev/packages/activity_calendar)

Github-like activity calendar widget.

| Vertical  | Horizontal |
| - | - |
| ![Vertical screenshot](https://raw.githubusercontent.com/Vorkytaka/activity_calendar/assets/vertical.png)  | ![Vertical screenshot](https://raw.githubusercontent.com/Vorkytaka/activity_calendar/assets/horizontal.png)  |

## Features

* Activity Calendar for any days count
* Customizable view
* Optional tooltip for each item
* Optional on tap listener for each item

## Usage

For use `ActivityCalendar` all you need to do is push `List<int>` that represent count of activity per day.

```dart
ActivityCalendar(
  activities: activities,
)
```

Also `ActivityCalendar` have some arguments to customize it's view.

### Tooltips

![Tooltip example](https://raw.githubusercontent.com/Vorkytaka/activity_calendar/assets/tooltip.jpg)

When you need to have a tooltips for each item, then all you need to do is pass `TooltipBuilder? tooltipBuilder` argument to `ActivityCalendar`.
`TooltipBuilder` can be created with one of two constructors:

```dart
// Simple text
// Builder must return String
TooltipBuilder.text(
  builder: (int i) => '${activities[i]} contributions',
  textStyle: TextStyle(fontWeight: FontWeight.bold),
);

// Rich text
// Builder must return InlineSpan
TooltipBuilder.rich(
  builder: (int i) => TextSpan(
    children: [
      TextSpan(
        text: '${activities[i]} contributions',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      TextSpan(
        text: ' on ${calculateDate(i)}',
      ),
    ],
  ),
);
```

Both `TooltipBuilder` constructors have an arguments to customize tooltips, such as `padding`, `margin`, etc.

#### Activity Calendar is the Scroll View

You need to remember, that `ActivityCalendar` use `GridView` under the hood.
So, if you want to use it inside another `ScrollView` with same `scrollDirection`, then
you need to use `shrinkWrap: true` or `NestedScrollView`.

`ActivityCalendar` have all arguments, that `GridView` has, so, you can customize it behavior.

_(If you want to know more about nested scrolls, then look for [this video](https://youtu.be/LUqDNnv_dh0) by Flutter team)_