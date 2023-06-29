import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

abstract class AbstractEndeavorBlock extends Equatable implements Scheduled {
  final String title;
  final EndeavorReference endeavorReference;
  final AbstractEvent abstractEvent;

  AbstractEndeavorBlock({
    required this.title,
    required this.endeavorReference,
    required this.abstractEvent,
  });
}
