import 'package:data_repository/data_repository.dart';

import '../endeavor_block_screen_bloc.dart';

class EditEndeavorBlockScreenBloc extends EndeavorBlockScreenBloc {
  EditEndeavorBlockScreenBloc({
    required DataRepository dataRepository,
    required EndeavorBlock endeavorBlock,
  }) : super(
          EndeavorBlockScreenState(
            endeavor:
                EndeavorPickerRowInput.pure(null, endeavorBlock.endeavorId),
            type: EndeavorBlockTypeInput.pure(endeavorBlock.type!),
            event: EventInput.pure(endeavorBlock.event),
            isEdit: true,
            isLoading:
                true, // start in loading state to make time to load endeavor title
          ),
        ) {
    dataRepository.getEndeavorTitle().then((value) => add(TitleLoaded(value)));

    on<TitleLoaded>((event, emit) => emit(state.copyWith(
          endeavorTitle: event.title,
          isLoading: false,
        )));

    on<EndeavorChanged>(
      (event, emit) => throw UnimplementedError(),
    );
  }
}
