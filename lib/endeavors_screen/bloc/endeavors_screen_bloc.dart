import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cached_query_flutter/cached_query_flutter.dart';
import 'package:data_models/data_models.dart';
import 'package:shim_data_service/shim_data_service.dart';
import 'package:equatable/equatable.dart';

part 'endeavors_screen_event.dart';
part 'endeavors_screen_state.dart';

class EndeavorsScreenBloc
    extends Bloc<EndeavorsScreenEvent, EndeavorsScreenState> {
  late final StreamSubscription<QueryState<List<Endeavor>>> _streamSubscription;

  EndeavorsScreenBloc() : super(EndeavorsScreenState.initial()) {
    // on<ReorderEndeavors>((event, emit) {
    //   final newPrimaryEndeavorsList = state.primaryEndeavors.reorderedCopy(
    //     event.oldIndex,
    //     event.newIndex,
    //   );
    //   emit(EndeavorsScreenState(newPrimaryEndeavorsList));
    //   ShimDataService.endeavors.reorderPrimaryEndeavors(
    //     newPrimaryEndeavorsList.map((e) => e.id).toList(),
    //   );
    // });

    on<StreamUpdate>((event, emit) {
      emit(EndeavorsScreenState(event.primaryEndeavors ?? [], event.status));
    });

    on<DeleteEndeavor>(
      (event, emit) {
        ShimDataService.endeavors.deletePrimaryEndeavor(event.endeavor);
      },
    );

    _streamSubscription = ShimDataService.endeavors.primaryEndeavorsStream
        .listen((newPrimaryEndeavors) {
      add(StreamUpdate(newPrimaryEndeavors.data, newPrimaryEndeavors.status));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
