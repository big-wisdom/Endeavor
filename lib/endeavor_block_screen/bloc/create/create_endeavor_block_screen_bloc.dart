import 'package:data_repository/data_repository.dart';

import '../endeavor_block_screen_bloc.dart';

class CreateEndeavorBlockScreenBloc extends EndeavorBlockScreenBloc {
  CreateEndeavorBlockScreenBloc()
      : super(
          SingleEndeavorBlockScreenState(
            endeavorReference: EndeavorPickerRowInput.pure(null),
            event: EventInput.pure(null),
            isEdit: false,
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
