import 'package:server_data_models/server_data_models.dart';

class ServerEndeavorBlock {
  const ServerEndeavorBlock({
    required this.id,
    required this.endeavorId,
    required this.serverEvent,
    required this.repeatingEndeavorBlockId,
  });

  final String id;
  final String endeavorId;
  final ServerEvent serverEvent;
  final String? repeatingEndeavorBlockId;
}
