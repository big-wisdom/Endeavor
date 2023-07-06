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
