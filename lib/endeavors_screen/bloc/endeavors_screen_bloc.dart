import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:shim_data_service/shim_data_service.dart';
import 'package:endeavor/util.dart';
import 'package:equatable/equatable.dart';

part 'endeavors_screen_event.dart';
part 'endeavors_screen_state.dart';

class EndeavorsScreenBloc
    extends Bloc<EndeavorsScreenEvent, EndeavorsScreenState> {
  late final StreamSubscription<List<Endeavor>> _streamSubscription;

  EndeavorsScreenBloc() : super(const EndeavorsScreenState([])) {
    on<ReorderEndeavors>((event, emit) {
      final newPrimaryEndeavorsList = state.primaryEndeavors.reorderedCopy(
        event.oldIndex,
        event.newIndex,
      );
      emit(EndeavorsScreenState(newPrimaryEndeavorsList));
      ShimDataService.endeavors.reorderPrimaryEndeavors(
        newPrimaryEndeavorsList.map((e) => e.id).toList(),
      );
    });

    on<NewPrimaryEndeavors>((event, emit) {
      emit(EndeavorsScreenState(event.newPrimaryEndeavors));
    });

    on<DeleteEndeavor>(
      (event, emit) {
        ShimDataService.endeavors.deletePrimaryEndeavor(event.endeavor);
      },
    );

    _streamSubscription =
        ShimDataService.endeavors.endeavorsStream.listen((newPrimaryEndeavors) {
      add(NewPrimaryEndeavors(newPrimaryEndeavors));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
