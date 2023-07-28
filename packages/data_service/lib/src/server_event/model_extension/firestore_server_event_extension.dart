import 'package:cloud_firestore/cloud_firestore.dart';
import 'server_event_database_field.dart';
import 'package:server_data_models/server_data_models.dart';

extension FirestoreServerEventExtension on ServerEvent {
  static ServerEvent fromDocSnapData(Map<String, dynamic> docSnapData) {
    return ServerEvent(
      start: DateTime.fromMicrosecondsSinceEpoch(
        (docSnapData['start'] as Timestamp).microsecondsSinceEpoch,
      ),
      end: DateTime.fromMicrosecondsSinceEpoch(
        (docSnapData['end'] as Timestamp).microsecondsSinceEpoch,
      ),
    );
  }

  Map<String, dynamic> toData() {
    return {
      ServerEventDatabaseFields.start.string(): start,
      ServerEventDatabaseFields.end.string(): end,
    };
  }

  static List<ServerEvent> listFromDocSnapData(dynamic data) {
    return (data as List)
        .map((e) => e as Map<String, dynamic>)
        .map((e) => fromDocSnapData(e))
        .toList();
  }
}
