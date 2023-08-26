import 'package:data_models/data_models.dart';

abstract class AbstractSingleEndeavorBlock extends AbstractEndeavorBlock {
  final String? repeatingEndeavorBlockId;
  final Event event;

  AbstractSingleEndeavorBlock({
    required this.repeatingEndeavorBlockId,
    required super.endeavorReference,
    required Event event,
  })  : this.event = event,
        super(
          abstractEvent: event,
        );

  @override
  List<Object?> get props => [
        event,
        repeatingEndeavorBlockId,
        endeavorReference,
      ];

  @override
  List<WeekViewEvent> get weekViewEvents => throw UnimplementedError();
}
