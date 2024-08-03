import 'package:data_models/data_models.dart';
import 'package:date_and_time_utilities/date_and_time_utilities.dart';
import 'package:endeavor/endeavor_block_screen/endeavor_block_screen.dart';
import 'package:endeavor/task_screen/view/task_screen.dart';
import 'package:endeavor/week_screen/bloc/week_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week_view/flutter_week_view.dart';

import '../../calendar_event_screen/view/calendar_event_screen.dart';

class WeekScreenView extends StatelessWidget {
  const WeekScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final weekBloc = context.read<WeekScreenBloc>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<WeekScreenBloc, WeekScreenState>(
          builder: (context, state) {
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
              dates: weekBloc.monthRange,
              events: state.events
                  .map(
                    (e) => FlutterWeekViewEvent(
                      backgroundColor:
                          e.backgroundColor ?? Theme.of(context).primaryColor,
                      title: e.title,
                      description: '',
                      start: e.start,
                      end: e.end,
                      onTap: () => _onTap(context, e),
                    ),
                  )
                  .toList(),
              style: WeekViewStyle(dayViewWidth: constraints.maxWidth),
            );
          },
        );
      },
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
