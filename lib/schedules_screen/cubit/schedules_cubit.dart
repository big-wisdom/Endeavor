import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';
import 'package:shim_data_service/shim_data_service.dart';

part 'schedules_state.dart';

class SchedulesCubit extends Cubit<SchedulesState> {
  late final StreamSubscription<QueryState<List<Schedule>>> _streamSubscription;

  SchedulesCubit() : super(LoadingSchedulesState()) {
    _streamSubscription = ShimDataService.schedules.stream.listen((qs) {
      switch (qs.status) {
        case QueryStatus.initial:
        case QueryStatus.success:
          emit(LoadedSchedulesState(qs.data ?? []));
          break;
        case QueryStatus.loading:
          emit(LoadingSchedulesState());
          break;
        case QueryStatus.error:
          emit(ErrorSchedulesState("Error: ${qs.error}"));
          break;
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
