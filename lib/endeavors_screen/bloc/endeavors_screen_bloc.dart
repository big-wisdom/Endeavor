import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:data_repository/data_repository.dart';
import 'package:data_service/data_service.dart';
import 'package:endeavor/util.dart';
import 'package:equatable/equatable.dart';

part 'endeavors_screen_event.dart';
part 'endeavors_screen_state.dart';

class EndeavorsScreenBloc
    extends Bloc<EndeavorsScreenEvent, EndeavorsScreenState> {
  final DataRepository _dataRepository;
  late final StreamSubscription<List<Endeavor>> _streamSubscription;

  EndeavorsScreenBloc(this._dataRepository)
      : super(const EndeavorsScreenState([])) {
    on<ReorderEndeavors>((event, emit) {
      final newPrimaryEndeavorsList = (state.primaryEndeavors
        ..reorder(
          event.oldIndex,
          event.newIndex,
        ));
      emit(EndeavorsScreenState(newPrimaryEndeavorsList));
      ServerEndeavorDataServiceExtension.reorderPrimaryEndeavors(
        newPrimaryEndeavorsList.map((e) => e.id).toList(),
      );
    });

    on<NewPrimaryEndeavors>((event, emit) {
      emit(EndeavorsScreenState(event.newPrimaryEndeavors));
    });

    on<DeleteEndeavor>(
      (event, emit) {
        ServerEndeavorDataServiceExtension.deletePrimaryEndeavor(
            event.endeavor);
      },
    );

    _streamSubscription = _dataRepository.orderedPrimaryEndeavorsStream
        .listen((newPrimaryEndeavors) {
      add(NewPrimaryEndeavors(newPrimaryEndeavors));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
