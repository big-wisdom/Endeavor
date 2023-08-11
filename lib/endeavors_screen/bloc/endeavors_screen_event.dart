part of 'endeavors_screen_bloc.dart';

abstract class EndeavorsScreenEvent extends Equatable {
  const EndeavorsScreenEvent();
}

class ReorderEndeavors extends EndeavorsScreenEvent {
  const ReorderEndeavors(this.oldIndex, this.newIndex);

  final int oldIndex;
  final int newIndex;

  @override
  List<Object?> get props => [oldIndex, newIndex];
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
