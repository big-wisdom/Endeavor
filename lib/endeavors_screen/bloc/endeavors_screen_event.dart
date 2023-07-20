part of 'endeavors_screen_bloc.dart';

abstract class EndeavorsScreenEvent extends Equatable {
  const EndeavorsScreenEvent();
}

class NewPrimaryEndeavors extends EndeavorsScreenEvent {
  const NewPrimaryEndeavors(this.newPrimaryEndeavors);

  final List<Endeavor> newPrimaryEndeavors;

  @override
  List<Object?> get props => [newPrimaryEndeavors];
}

class DeleteEndeavor extends EndeavorsScreenEvent {
  const DeleteEndeavor(this.endeavor);

  final Endeavor endeavor;

  @override
  List<Object?> get props => [endeavor];
}
