import 'package:data_models/data_models.dart';

abstract class AbstractRepeatingEndeavorBlock extends AbstractEndeavorBlock {
  final RepeatingEvent repeatingEvent;

  AbstractRepeatingEndeavorBlock({
    required super.endeavorReference,
    required RepeatingEvent repeatingEvent,
  })  : this.repeatingEvent = repeatingEvent,
        super(abstractEvent: repeatingEvent);

  @override
  List<Object?> get props => [
        repeatingEvent,
        endeavorReference,
      ];

  @override
  List<WeekViewEvent> get weekViewEvents => throw UnimplementedError();
}
