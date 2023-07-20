import 'package:data_repository/data_repository.dart' show Endeavor;
import 'package:equatable/equatable.dart';

class EndeavorNode extends Equatable {
  const EndeavorNode({
    required this.endeavor,
    required this.subEndeavors,
  });

  final Endeavor endeavor;
  final List<EndeavorNode> subEndeavors;

  @override
  List<Object?> get props => [endeavor, subEndeavors];
}
