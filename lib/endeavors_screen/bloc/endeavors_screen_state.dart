part of 'endeavors_screen_bloc.dart';

class EndeavorsScreenState extends Equatable {
  const EndeavorsScreenState(this.primaryEndeavors);

  final List<Endeavor> primaryEndeavors;

  @override
  List<Object> get props => [primaryEndeavors];
}
