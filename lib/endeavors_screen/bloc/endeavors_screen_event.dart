part of 'endeavors_screen_bloc.dart';

abstract class EndeavorsScreenEvent extends Equatable {
  const EndeavorsScreenEvent();

  @override
  List<Object> get props => [];
}

class NewPrimaryEndeavorList extends EndeavorsScreenEvent {
  const NewPrimaryEndeavorList(this.newPrimaryEndeavorList);

  final List<Endeavor> newPrimaryEndeavorList;
}

class DeleteEndeavor extends EndeavorsScreenEvent {
  const DeleteEndeavor(this.endeavor);

  final Endeavor endeavor;
}
