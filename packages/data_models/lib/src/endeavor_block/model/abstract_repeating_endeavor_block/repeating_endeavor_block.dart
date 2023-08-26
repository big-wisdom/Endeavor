import 'package:data_models/data_models.dart';

class RepeatingEndeavorBlock extends AbstractRepeatingEndeavorBlock {
  final String id;

  RepeatingEndeavorBlock({
    required this.id,
    required super.endeavorReference,
    required super.repeatingEvent,
  });

  @override
  List<Object?> get props => [...super.props, id];
}
