import 'package:data_repository/data_repository.dart';

abstract class Scheduled {
  final String title;
  final EndeavorReference endeavorReference;
  final AbstractEvent abstractEvent;

  Scheduled({
    required this.title,
    required this.endeavorReference,
    required this.abstractEvent,
  });

  List<WeekViewEvent> get weekViewEvents;
}
