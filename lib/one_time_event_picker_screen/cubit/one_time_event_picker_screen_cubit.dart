import 'package:bloc/bloc.dart';
import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';

part 'one_time_event_picker_screen_state.dart';

class OneTimeEventPickerScreenCubit
    extends Cubit<OneTimeEventPickerScreenState> {
  final void Function(Event newEvent) onEvent;

  OneTimeEventPickerScreenCubit({
    required this.onEvent,
    Event? initialEvent,
  }) : super(OneTimeEventPickerInitial(EventInput.pure(initialEvent)));

  void done() {
    if (state.event != null) {
      onEvent(state.event!.value);
    }
  }

  void setEvent(EventInput newEvent) {
    emit(OneTimeEventPickerScreenState(newEvent));
  }
}
