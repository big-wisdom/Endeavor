import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';

abstract class AbstractCalendarEvent extends Equatable implements Scheduled {
  const AbstractCalendarEvent({
    required this.title,
    required this.abstractEvent,
    this.endeavorReference,
  });

  final String title;
  final AbstractEvent abstractEvent;
  final EndeavorReference? endeavorReference;

  @override
  List<WeekViewEvent> get weekViewEvents => throw UnimplementedError();
}

enum CalendarEventType { single, repeating }
