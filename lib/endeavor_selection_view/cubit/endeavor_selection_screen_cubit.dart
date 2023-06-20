import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'endeavor_selection_screen_state.dart';

class EndeavorSelectionScreenCubit extends Cubit<EndeavorSelectionScreenState> {
  EndeavorSelectionScreenCubit() : super(EndeavorSelectionScreenInitial());
}
