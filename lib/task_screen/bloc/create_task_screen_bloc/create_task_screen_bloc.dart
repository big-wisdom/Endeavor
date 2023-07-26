import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';

import '../task_screen_bloc.dart';

part 'create_task_screen_event.dart';

class CreateTaskScreenBloc extends TaskScreenBloc {
  CreateTaskScreenBloc({required DataRepository dataRepository})
      : super(dataRepository: dataRepository) {
    on<CreateTaskRequested>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EndeavorSelected>(
      (event, emit) => throw UnimplementedError(),
    );

    on<TitleChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<DurationChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<DivisibilityChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<MinnimumSchedulingDurationChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EventCreated>(
      (event, emit) => throw UnimplementedError(),
    );

    on<EventDeleted>(
      (event, emit) => throw UnimplementedError(),
    );
  }
}
