import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'task_screen_event.dart';
part 'task_screen_state.dart';

abstract class TaskScreenBloc extends Bloc<TaskScreenEvent, TaskScreenState> {
  final EndeavorReference? initialEndeavorReference;
  final TaskReference? initialTaskReference;

  TaskScreenBloc(
      {required this.initialEndeavorReference,
      required this.initialTaskReference})
      : super(initialTaskReference != null
            ? LoadingEditTaskScreenState(
                taskReference: initialTaskReference,
                endeavorReference: initialEndeavorReference,
              )
            : CreateTaskScreenState.initial(initialEndeavorReference));
}
