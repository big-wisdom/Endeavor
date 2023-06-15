import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:data_repository/data_repository.dart';
import 'package:formz/formz.dart';
import '../formz/endeavor_id.dart';
import '../formz/title.dart';
import '../formz/duration_field.dart';
import '../formz/divisibilityBox.dart';
import '../formz/minnimum_scheduling_duration.dart';

part 'task_screen_event.dart';
part 'task_screen_state.dart';

abstract class TaskScreenBloc extends Bloc<TaskScreenEvent, TaskScreenState> {
  TaskScreenBloc({required this.dataRepository})
      : super(const TaskScreenInitial());

  final DataRepository dataRepository;
}
