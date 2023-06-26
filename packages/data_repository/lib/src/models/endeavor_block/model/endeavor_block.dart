import 'package:data_repository/data_repository.dart';
import 'package:equatable/equatable.dart';

class EndeavorBlock extends Equatable {
  final String? id;
  final String? endeavorId;
  final EndeavorBlockType? type;
  final String? repeatingEndeavorBlockId;
  final Event? event;

  EndeavorBlock(
      {this.id,
      this.endeavorId,
      this.type,
      this.event,
      this.repeatingEndeavorBlockId});

  @override
  List<Object?> get props =>
      [id, endeavorId, type, repeatingEndeavorBlockId, event];
}

enum EndeavorBlockType { single, repeating }
