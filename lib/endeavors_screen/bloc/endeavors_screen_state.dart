part of 'endeavors_screen_bloc.dart';

class EndeavorsScreenState extends Equatable {
  EndeavorsScreenState.fromQueryState(QueryState<List<Endeavor>> queryState)
      : primaryEndeavors =
            queryState.status == QueryStatus.success ? queryState.data! : [],
        queryStatus = queryState.status;

  EndeavorsScreenState.initial()
      : primaryEndeavors = [],
        queryStatus = QueryStatus.initial;

  final List<Endeavor> primaryEndeavors;
  final QueryStatus queryStatus;

  @override
  List<Object> get props => [primaryEndeavors];
}
