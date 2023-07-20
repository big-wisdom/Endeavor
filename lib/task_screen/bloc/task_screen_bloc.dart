import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:data_repository/data_repository.dart';
import 'package:formz/formz.dart';

part 'task_screen_event.dart';
part 'task_screen_state.dart';

abstract class TaskScreenBloc extends Bloc<TaskScreenEvent, TaskScreenState> {
  TaskScreenBloc({required this.dataRepository, TreeOfLife? treeOfLife})
      : super(TaskScreenInitial(treeOfLife));

  final DataRepository dataRepository;
}
