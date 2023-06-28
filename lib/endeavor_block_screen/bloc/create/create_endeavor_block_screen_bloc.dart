import 'package:data_repository/data_repository.dart';

import '../endeavor_block_screen_bloc.dart';

class CreateEndeavorBlockScreenBloc extends EndeavorBlockScreenBloc {
  CreateEndeavorBlockScreenBloc()
      : super(
          EndeavorBlockScreenState(
            endeavor: EndeavorPickerRowInput.pure(null, null),
            type: EndeavorBlockTypeInput.pure(EndeavorBlockType.single),
            event: EventInput.pure(null),
            isEdit: false,
            isLoading: false,
          ),
        ) {
    on<EndeavorChanged>(
      (event, emit) => throw UnimplementedError(),
    );
  }
}
