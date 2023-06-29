import 'package:data_repository/data_repository.dart';

class EndeavorBlock extends AbstractSingleEndeavorBlock {
  final String id;

  EndeavorBlock({
    required this.id,
    required super.event,
    super.repeatingEndeavorBlockId,
  });

  @override
  List<Object?> get props =>
      [id, endeavorId, type, repeatingEndeavorBlockId, event];

  @override
  // TODO: implement abstractEvent
  AbstractEvent get abstractEvent => throw UnimplementedError();

  @override
  // TODO: implement endeavorReference
  EndeavorReference get endeavorReference => throw UnimplementedError();

  @override
  // TODO: implement title
  String get title => throw UnimplementedError();

  @override
  // TODO: implement weekViewEvents
  List<WeekViewEvent> get weekViewEvents => throw UnimplementedError();
}

enum EndeavorBlockType { single, repeating }
