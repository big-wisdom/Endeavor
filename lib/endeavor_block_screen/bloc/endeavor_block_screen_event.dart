part of 'endeavor_block_screen_bloc.dart';

abstract class EndeavorBlockScreenEvent extends Equatable {
  const EndeavorBlockScreenEvent();
}

class EndeavorChanged extends EndeavorBlockScreenEvent {
  const EndeavorChanged(this.endeavor);

  final Endeavor? endeavor;

  @override
  List<Object?> get props => [endeavor];
}

class TypeChanged extends EndeavorBlockScreenEvent {
  const TypeChanged(this.newType);

  final EndeavorBlockType newType;

  @override
  List<Object?> get props => [newType];
}

class EventChanged extends EndeavorBlockScreenEvent {
  const EventChanged(this.newEventInput);

  final EventInput newEventInput;

  @override
  List<Object?> get props => [newEventInput];
}

class RepeatingEventChanged extends EndeavorBlockScreenEvent {
  const RepeatingEventChanged(this.newRepeatingEventInput);

  final RepeatingEventInput newRepeatingEventInput;

  @override
  List<Object?> get props => [];
}

class Save extends EndeavorBlockScreenEvent {
  const Save();

  @override
  List<Object?> get props => [];
}

class DeleteRequested extends EndeavorBlockScreenEvent {
  const DeleteRequested();

  @override
  List<Object?> get props => [];
}
