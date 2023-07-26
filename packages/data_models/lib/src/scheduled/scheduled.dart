import 'package:data_models/data_models.dart';

abstract class Scheduled {
  final String title;
  final EndeavorReference? endeavorReference;
  final AbstractEvent abstractEvent;

  Scheduled({
    required this.title,
    required this.endeavorReference,
    required this.abstractEvent,
  });

  // TODO: I think this needs to become a function takes in a Future<Color> Function(endeavorId)
  // that way, when there are multiple items coming in, and they may belong to different endeavors,
  // that function can run to the data service and grab the color.

  // Note: it should also be storing a local Map<String(endeavorId), Color) so the data service only has to run
  // once per endeavor
  List<WeekViewEvent> get weekViewEvents;
}
