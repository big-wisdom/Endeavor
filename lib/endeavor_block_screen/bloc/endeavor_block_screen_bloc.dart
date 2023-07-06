import 'package:bloc/bloc.dart';
import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'endeavor_block_screen_event.dart';
part 'endeavor_block_screen_state.dart';

abstract class EndeavorBlockScreenBloc
    extends Bloc<EndeavorBlockScreenEvent, EndeavorBlockScreenState> {
  EndeavorBlockScreenBloc(EndeavorBlockScreenState initialState)
      : super(initialState);
}
