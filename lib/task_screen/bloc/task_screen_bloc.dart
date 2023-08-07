import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
// import 'package:data_repository/data_repository.dart';
import 'package:formz/formz.dart';

part 'task_screen_event.dart';
part 'task_screen_state.dart';

abstract class TaskScreenBloc extends Bloc<TaskScreenEvent, TaskScreenState> {
  TaskScreenBloc({
    // required this.dataRepository,
    this.initialEndeavorReference,
  }) : super(TaskScreenInitial(initialEndeavorReference));

  final EndeavorReference? initialEndeavorReference;
  // final DataRepository dataRepository;
}
