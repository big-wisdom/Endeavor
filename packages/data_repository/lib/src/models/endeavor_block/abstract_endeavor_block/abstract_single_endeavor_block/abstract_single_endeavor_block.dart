import 'package:data_repository/data_repository.dart';

abstract class AbstractSingleEndeavorBlock extends AbstractEndeavorBlock {
  final String? repeatingEndeavorBlockId;

  AbstractSingleEndeavorBlock({
    required super.title,
    required this.repeatingEndeavorBlockId,
    required super.endeavorReference,
    required Event event,
  }) : super(abstractEvent: event);
}
