import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class AbstractEndeavorBlock extends Equatable implements Scheduled {
  final EndeavorReference endeavorReference;
  final AbstractEvent abstractEvent;

  String get title => endeavorReference.endeavorTitle;

  AbstractEndeavorBlock({
    required this.endeavorReference,
    required this.abstractEvent,
  });

  @override
  List<WeekViewEvent> get weekViewEvents => throw UnimplementedError();
}
