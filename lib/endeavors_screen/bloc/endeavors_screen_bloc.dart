import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

part 'endeavors_screen_event.dart';
part 'endeavors_screen_state.dart';

class EndeavorsScreenBloc
    extends Bloc<EndeavorsScreenEvent, EndeavorsScreenState> {
  final DataRepository _dataRepository;
  late final StreamSubscription<List<Endeavor>> _streamSubscription;

  EndeavorsScreenBloc(this._dataRepository)
      : super(const EndeavorsScreenState([])) {
    on<NewPrimaryEndeavorList>((event, emit) {
      emit(EndeavorsScreenState(event.newPrimaryEndeavorList));
    });
    on<DeleteEndeavor>(
      (event, emit) {
        _dataRepository.deleteEndeavor(event.endeavor);
      },
    );
    _dataRepository.primaryEndeavorStream().listen((newPrimaryEndeavorList) {
      add(NewPrimaryEndeavorList(newPrimaryEndeavorList));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
