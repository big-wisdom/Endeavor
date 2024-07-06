part of 'endeavors_screen_bloc.dart';

class EndeavorsScreenState extends Equatable {
  EndeavorsScreenState(this.primaryEndeavors, this.queryStatus);

  EndeavorsScreenState.initial()
      : primaryEndeavors = [],
        queryStatus = QueryStatus.initial;

  final List<Endeavor> primaryEndeavors;
  final QueryStatus queryStatus;

  @override
  List<Object> get props => [primaryEndeavors, queryStatus];
}
