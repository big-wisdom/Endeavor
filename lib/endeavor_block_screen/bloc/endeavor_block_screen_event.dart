part of 'endeavor_block_screen_bloc.dart';

abstract class EndeavorBlockScreenEvent extends Equatable {
  const EndeavorBlockScreenEvent();
}

class TitleLoaded extends EndeavorBlockScreenEvent {
  const TitleLoaded(this.title);

  final String title;

  @override
  List<Object?> get props => [title];
}

class EndeavorChanged extends EndeavorBlockScreenEvent {
  const EndeavorChanged(this.endeavor);

  final Endeavor endeavor;

  @override
  List<Object?> get props => [endeavor];
}
