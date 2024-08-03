import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'endeavors_screen_state.dart';

class EndeavorsScreenCubit extends Cubit<EndeavorsScreenState> {
  EndeavorsScreenCubit() : super(EndeavorsScreenInitial());
}
