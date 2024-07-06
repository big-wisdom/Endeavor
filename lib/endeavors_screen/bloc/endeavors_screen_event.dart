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

class StreamUpdate extends EndeavorsScreenEvent {
  const StreamUpdate(this.primaryEndeavors, this.status);

  final List<Endeavor>? primaryEndeavors;
  final QueryStatus status;

  @override
  List<Object?> get props => [primaryEndeavors, status];
}

class DeleteEndeavor extends EndeavorsScreenEvent {
  const DeleteEndeavor(this.endeavor);

  final Endeavor endeavor;

  @override
  List<Object?> get props => [endeavor];
}
