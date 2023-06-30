import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'repeating_event_picker_state.dart';

class RepeatingEventPickerCubit extends Cubit<RepeatingEventPickerState> {
  final void Function(RepeatingEvent repeatingEvent) onChanged;
  final RepeatingEvent? initialRepeatingEvent;

  RepeatingEventPickerCubit({
    this.initialRepeatingEvent,
    required this.onChanged,
  }) : super(RepeatingEventPickerInitial());
}
