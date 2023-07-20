import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class AbstractEndeavorBlock extends Equatable implements Scheduled {
  AbstractEndeavorBlock({
    required this.endeavorReference,
    required this.abstractEvent,
  });

  final EndeavorReference endeavorReference;
  final AbstractEvent abstractEvent;

  String get title => endeavorReference.title;

  @override
  List<WeekViewEvent> get weekViewEvents => throw UnimplementedError();
}

enum EndeavorBlockType { single, repeating }
