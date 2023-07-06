import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class RepeatingEventForm extends Equatable with FormzMixin {
  RepeatingEventForm({
    required this.daysOfWeekInput,
    required this.endDateInput,
    required this.startDateInput,
    required this.startTimeInput,
    required this.endTimeInput,
  });

  final RepeatingEventDaysOfWeekInput daysOfWeekInput;
  final RepeatingEventEndDateInput endDateInput;
  final RepeatingEventStartDateInput startDateInput;
  final RepeatingEventStartTimeInput startTimeInput;
  final RepeatingEventEndTimeInput endTimeInput;

  @override
  List<FormzInput> get inputs => [
        daysOfWeekInput,
        endDateInput,
        startDateInput,
        startTimeInput,
        endTimeInput,
      ];

  RepeatingEvent? createRepeatingEvent() {
    if (status.isValid) {
      return RepeatingEvent(
        startDate: startDateInput.value,
        endDate: endDateInput.value,
        startTime: startTimeInput.value,
        endTime: endTimeInput.value,
        daysOfWeek: daysOfWeekInput.value,
      );
    }
    return null;
  }
}
