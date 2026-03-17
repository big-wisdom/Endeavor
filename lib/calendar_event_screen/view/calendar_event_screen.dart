import 'package:data_models/data_models.dart';
import 'package:endeavor/calendar_event_screen/calendar_event_screen.dart';
import 'package:endeavor/calendar_event_screen/view/calendar_event_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarEventScreen extends StatelessWidget {
  final CalendarEvent? _calendarEvent;
  final bool _repeatingOnly;
  final RepeatingCalendarEvent? _repeatingCalendarEvent;

  final void Function(UnidentifiedCalendarEvent)? _onSaveCalendarEvent;
  final void Function(UnidentifiedRepeatingCalendarEvent)?
      _onSaveRepeatingCalendarEvent;
  final void Function()? _onDelete;
  final void Function()? _onDeleteThisAndFollowing;
  final void Function(UnidentifiedCalendarEvent)? _onEditThisAndFollowing;

  CalendarEventScreen.create({
    required void Function(UnidentifiedCalendarEvent) onSaveEvent,
    required void Function(UnidentifiedRepeatingCalendarEvent)
        onSaveRepeatingEvent,
    super.key,
  })  : _calendarEvent = null,
        _repeatingOnly = false,
        _repeatingCalendarEvent = null,
        _onSaveCalendarEvent = onSaveEvent,
        _onSaveRepeatingCalendarEvent = onSaveRepeatingEvent,
        _onDelete = null,
        _onDeleteThisAndFollowing = null,
        _onEditThisAndFollowing = null;

  CalendarEventScreen.edit({
    required CalendarEvent calendarEvent,
    required void Function(UnidentifiedCalendarEvent) onSave,
    required void Function() onDelete,
    void Function()? onDeleteThisAndFollowing,
    void Function(UnidentifiedCalendarEvent)? onEditThisAndFollowing,
    super.key,
  })  : _calendarEvent = calendarEvent,
        _repeatingOnly = false,
        _repeatingCalendarEvent = null,
        _onSaveCalendarEvent = onSave,
        _onSaveRepeatingCalendarEvent = null,
        _onDelete = onDelete,
        _onDeleteThisAndFollowing = onDeleteThisAndFollowing,
        _onEditThisAndFollowing = onEditThisAndFollowing;

  CalendarEventScreen.repeatingOnly({
    required RepeatingCalendarEvent? repeatingCalendarEvent,
    required void Function(UnidentifiedRepeatingCalendarEvent) onSave,
    void Function()? onDelete,
    super.key,
  })  : _calendarEvent = null,
        _repeatingOnly = true,
        _repeatingCalendarEvent = repeatingCalendarEvent,
        _onSaveCalendarEvent = null,
        _onSaveRepeatingCalendarEvent = onSave,
        _onDelete = onDelete,
        _onDeleteThisAndFollowing = null,
        _onEditThisAndFollowing = null;

  @override
  Widget build(BuildContext context) {
    final CalendarEventScreenBloc bloc;

    if (_repeatingOnly) {
      final rce = _repeatingCalendarEvent;
      if (rce != null) {
        bloc = CalendarEventScreenBloc.editRepeatingOnly(
          rce: rce,
          onSave: _onSaveRepeatingCalendarEvent!,
          onDeleteRepeatingEvent: _onDelete!,
        );
      } else {
        bloc = CalendarEventScreenBloc.createRepeatingOnly(
          onSave: _onSaveRepeatingCalendarEvent!,
        );
      }
    } else if (_calendarEvent != null) {
      bloc = CalendarEventScreenBloc.edit(
        initialEvent: _calendarEvent,
        onSave: _onSaveCalendarEvent!,
        onDeleteCalendarEvent: _onDelete!,
        onDeleteThisAndFollowingEvents: _onDeleteThisAndFollowing ?? () {},
        onEditThisAndFollwingEvents: _onEditThisAndFollowing ?? (_) {},
      );
    } else {
      bloc = CalendarEventScreenBloc.create(
        onSaveEvent: _onSaveCalendarEvent!,
        onSaveRepeatingEvent: _onSaveRepeatingCalendarEvent!,
      );
    }

    return BlocProvider(
      create: (_) => bloc,
      child: const CalendarEventScreenView(),
    );
  }
}
