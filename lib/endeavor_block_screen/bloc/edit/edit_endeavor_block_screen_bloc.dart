import 'package:data_repository/data_repository.dart';

import '../endeavor_block_screen_bloc.dart';

class EditEndeavorBlockScreenBloc extends EndeavorBlockScreenBloc {
  EditEndeavorBlockScreenBloc({
    required DataRepository dataRepository,
    required EndeavorBlock endeavorBlock,
  }) : super(
          SingleEndeavorBlockScreenState(
            endeavorReference:
                EndeavorPickerRowInput.pure(endeavorBlock.endeavorReference),
            event: EventInput.pure(endeavorBlock.event),
            isEdit: true,
          ),
        ) {
    on<EndeavorChanged>(
      (event, emit) => throw UnimplementedError(),
    );

    on<TypeChanged>(
      (event, emit) => throw UnimplementedError(),
    );
  }
}
