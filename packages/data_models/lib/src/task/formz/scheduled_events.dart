import 'package:data_models/data_models.dart';
import 'package:formz/formz.dart';

class ScheduledEventsError {}

class ScheduledEvents extends FormzInput<List<Event>, ScheduledEventsError> {
  const ScheduledEvents.pure(super.value) : super.pure();
  const ScheduledEvents.dirty(super.value) : super.dirty();

  @override
  ScheduledEventsError? validator(List<Event> value) {
    return null;
  }
}
