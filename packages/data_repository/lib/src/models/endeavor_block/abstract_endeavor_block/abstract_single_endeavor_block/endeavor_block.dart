import 'package:data_repository/data_repository.dart';

class EndeavorBlock extends AbstractSingleEndeavorBlock {
  final String id;

  EndeavorBlock({
    required this.id,
    required super.title,
    required super.event,
    super.repeatingEndeavorBlockId,
    required super.endeavorReference,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        event,
      ];

  @override
  List<WeekViewEvent> get weekViewEvents => throw UnimplementedError();
}

enum EndeavorBlockType { single, repeating }
