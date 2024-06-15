import 'package:data_models/data_models.dart';
import 'package:equatable/equatable.dart';

class TreeOfLife extends Equatable {
  const TreeOfLife(this.primaryEndeavorNodes);

  final List<EndeavorNode> primaryEndeavorNodes;

  @override
  List<Object?> get props => [primaryEndeavorNodes];
}
