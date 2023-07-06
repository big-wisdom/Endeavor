import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'time_picker_row_state.dart';

class TimePickerRowCubit extends Cubit<TimePickerRowState> {
  TimePickerRowCubit() : super(TimePickerRowInitial());
}
