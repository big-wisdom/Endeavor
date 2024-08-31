import 'package:data_models/data_models.dart';
import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:endeavor/endeavor_block_screen/endeavor_block_screen.dart';
import 'package:endeavor/task_screen/view/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

import '../../calendar_event_screen/view/calendar_event_screen.dart';

class ScheduleEditorView extends StatelessWidget {
  const ScheduleEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return WeekView(
              dayBarStyleBuilder: (date) {
                return DayBarStyle(
                  dateFormatter: (year, month, day) {
                    return DateTime(year, month, day).toCustomString();
                  },
                );
              },
              hoursColumnStyle: HoursColumnStyle(
                timeFormatter: (time) =>
                    "${time.hour > 12 ? time.hour - 12 : time.hour}:${time.minute.toString().padLeft(2, '0')}",
              ),
              // generate a list of the days of the week for the selected date
              dates: monthRange(DateTime.now()),
              events: const [],
              style: WeekViewStyle(dayViewWidth: constraints.maxWidth),
            );
          },
        ),
      ),
    );
  }

  void _onTap(BuildContext context, WeekViewEvent event) {
    MaterialPageRoute route;
    if (event.isEndeavorBlock) {
      route = MaterialPageRoute(
        builder: (context) => EndeavorBlockScreen.edit(
          EndeavorBlock(
            id: event.id,
            event: Event(start: event.start, end: event.end),
            endeavorReference: event.endeavorReference!,
            repeatingEndeavorBlockId: event.repeatingEventId,
          ),
        ),
      );
    } else if (event.taskId != null) {
      route = MaterialPageRoute(
        builder: (context) => TaskScreen.edit(
          const TaskReference(
            id: 0,
            endeavorId: 2,
            title: "eli",
          ),
        ),
      );
    } else {
      route = MaterialPageRoute(
        builder: (context) => CalendarEventScreen.edit(
          calendarEvent: CalendarEvent(
            id: event.id,
            title: event.title,
            event: Event(
              start: event.start,
              end: event.end,
            ),
            endeavorReference: event.endeavorReference,
            repeatingCalendarEventId: event.repeatingEventId,
          ),
        ),
      );
    }
    Navigator.push(context, route);
  }
}

List<DateTime> monthRange(DateTime selectedDay) {
  List<DateTime> dates = [];

  // Start at 30 days ago
  DateTime date = selectedDay.subtract(const Duration(days: 30));

  // Loop until 30 days from now
  while (date.isBefore(selectedDay.add(const Duration(days: 30)))) {
    dates.add(DateTime.utc(date.year, date.month, date.day));
    date = date.add(const Duration(days: 1));
  }

  return dates;
}
