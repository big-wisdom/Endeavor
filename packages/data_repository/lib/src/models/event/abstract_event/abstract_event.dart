import 'package:equatable/equatable.dart';
import 'event/event.dart';

abstract class AbstractEvent extends Equatable {
  List<Event> get events;
}
