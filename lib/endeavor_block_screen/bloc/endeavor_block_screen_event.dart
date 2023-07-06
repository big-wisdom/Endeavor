part of 'endeavor_block_screen_bloc.dart';

abstract class EndeavorBlockScreenEvent extends Equatable {
  const EndeavorBlockScreenEvent();
}

class EndeavorChanged extends EndeavorBlockScreenEvent {
  const EndeavorChanged(this.endeavor);

  final Endeavor endeavor;

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
  const EventChanged(this.newEvent);

  final Event newEvent;

  @override
  List<Object?> get props => [newEvent];
}

class RepeatingEventChanged extends EndeavorBlockScreenEvent {
  const RepeatingEventChanged(this.newRepeatingEvent);

  final RepeatingEvent newRepeatingEvent;

  @override
  List<Object?> get props => [];
}

class CreateRequested extends EndeavorBlockScreenEvent {
  const CreateRequested();

  @override
  List<Object?> get props => [];
}

class DeleteRequested extends EndeavorBlockScreenEvent {
  const DeleteRequested();

  @override
  List<Object?> get props => [];
}
