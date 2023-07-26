import 'package:data_models/data_models.dart';
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
