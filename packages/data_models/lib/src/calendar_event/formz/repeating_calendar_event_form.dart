import 'package:data_models/data_models.dart';

import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

abstract class RepeatingCalendarEventForm extends Equatable with FormzMixin {
  const RepeatingCalendarEventForm({
    required this.titleInput,
    required this.repeatingEventInput,
    required this.endeavorReference,
  });

  final CalendarEventTitleInput titleInput;
  final RepeatingEventInput repeatingEventInput;
  final EndeavorPickerRowInput endeavorReference;

  @override
  List<FormzInput> get inputs => [
        titleInput,
        repeatingEventInput,
        endeavorReference,
      ];
}
